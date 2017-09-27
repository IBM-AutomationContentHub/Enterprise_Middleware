#!/bin/bash

if [ "$#" -lt 7 ]; then
    echo "Usage: $0 <cam_hostname> <username> <password> <git URL> <GIT Token> <Branch> [catalog files]" >&2
    exit 1
fi

CAM_HOSTNAME=$1
USERNAME=$2
PASSWORD=$3
GITURL=$4
GITTOKEN=$5
BRANCH=$6

echo CAM_HOSTNAME=$CAM_HOSTNAME
echo USERNAME=$USERNAME
echo PASSWORD=$PASSWORD
echo GITURL=$GITURL
echo GITTOKEN=$GITTOKEN
echo BRANCH=$BRANCH

shift
shift
shift
shift
shift
shift

catalog_list=$@

echo '------------------------------------------------------------------'
echo 'Files to load'
echo '------------------------------------------------------------------'
for catalog in $catalog_list
do
   echo $catalog
done
echo '------------------------------------------------------------------'


CAM_HOST_URL="https://${CAM_HOSTNAME}:30000"

CATALOG_SERVICE_ENDPOINT="${CAM_HOST_URL}/cam/catalog/api/v1/Catalogs"
TEMPLATE_SERVICE_ENDPOINT="${CAM_HOST_URL}/cam/api/v1/templates"
TOKEN_SERVICE_ENDPOINT="${CAM_HOST_URL}/cam/v1/auth/camtoken"
TENANT_SERVICE_ENDPOINT="${CAM_HOST_URL}/cam/tenant/api/v1/tenants/getTenantOnPrem"

TEMPLATES_TEMP_FILE="./__templates__.json"
CATALOGS_TEMP_FILE="./__catalogs__.json"
CATALOG_TEMP_FILE="./__tempcatalog__.json"

# Finds the template that matches the name and type is 'prebuilt'
# in a lost of templates
#
# $1 - file that contains the template to be found
# $2 - file that contains the templates list
#
# Returns template ID.
function find_template_id {
PYTHON_ARG1="$1" PYTHON_ARG2="$2" python - <<END
import os, sys, json
template_file = os.environ['PYTHON_ARG1']
with open(template_file) as _template_file:    
    template = json.load(_template_file)

templates_file = os.environ['PYTHON_ARG2']
with open(templates_file) as _templates_file:    
    templates = json.load(_templates_file)

for _template in templates:
    if _template['name'] == template['name']:
        print _template['id']
        exit
END
}

function get_ids {
PYTHON_ARG1="$1" python - <<END
import os, sys, json
items = json.loads(os.environ['PYTHON_ARG1'])
for item in items:
    print item['id']
END
}

function write_temp_catalog {
PYTHON_ARG1="$1" PYTHON_ARG2="$2" PYTHON_ARG3="$3" PYTHON_ARG4="$4" PYTHON_ARG5="$5" python - <<END
import os, sys, json

template_file=os.environ['PYTHON_ARG1']
temp_file=os.environ['PYTHON_ARG2']
git_url=os.environ['PYTHON_ARG3']
git_token=os.environ['PYTHON_ARG4']
branch=os.environ['PYTHON_ARG5']
with open(template_file) as _template_file:
    template = json.load(_template_file)
template['manifest']['template_source']['githubRepoUrl'] = git_url
template['manifest']['template_source']['githubAccessToken'] = git_token
template['manifest']['template_source']['githubRef'] = branch
with open(temp_file, 'w+') as _temp_file:
    json.dump(template, _temp_file)
END
}

HEADER_CONTENT_TYPE_JSON="Content-Type: application/json"

####################################################################
#           Retrieve the bearer token
####################################################################
cat <<EOF >token_request.json
{
    "grant_type": "password",
    "password": "${PASSWORD}",
    "username": "${USERNAME}",
    "scope": "openid profile email"
}
EOF

result=$(curl -k -X POST "${TOKEN_SERVICE_ENDPOINT}" -H "${HEADER_CONTENT_TYPE_JSON}" -d @token_request.json --write-out "\n%{http_code}" --silent)
rm token_request.json

status="${result##*$'\n'}"
response="${result%$'\n'*}"

if [ "$status" -eq 200 ] 
then
    bearerToken=$( python -c "import sys, json;  data = json.dumps($response); print json.loads(data)[\"access_token\"]" )
    echo "Successfully retrieved bearer token. Status: ${status}"
else
    echo "Error retrieving the bearer token. Status: ${status}. Error: ${result%$'\n'*}"
    exit 1
fi

AUTHORIZATION_HEADER="Authorization: bearer ${bearerToken}"

####################################################################
#           Retrieve the tenant ID
####################################################################
result=$(curl -k -X GET "${TENANT_SERVICE_ENDPOINT}" -H "${HEADER_CONTENT_TYPE_JSON}" -H "${AUTHORIZATION_HEADER}" --write-out "\n%{http_code}" --silent)
echo "Result is : ${result}"

status="${result##*$'\n'}"
response="${result%$'\n'*}"
if [ "$status" -eq 200 ] 
then
    tenantId=$( python -c "import sys, json;  data = json.dumps($response); print json.loads(data)[\"id\"]" )
    echo "Successfully retrieved tenant id ${tenantId}."
else
    echo "Error retrieving the tenant id. Status: ${status}. Error: ${result%$'\n'*}"
    exit 1
fi

####################################################################
#           Retrieve all catalog entries
####################################################################

findCatalogResult=$(curl -k -X GET "${CATALOG_SERVICE_ENDPOINT}" -H "${HEADER_CONTENT_TYPE_JSON}" -H "${AUTHORIZATION_HEADER}" --write-out "\n%{http_code}" --silent)
findCatalogStatus="${findCatalogResult##*$'\n'}"

if [ "$findCatalogStatus" -eq 200 ]
then
    echo "Successfully retrieved the templates from IaaS."
else
    echo "Error retriving the template from IaaS. Status: ${findCatalogStatus}. Error: ${findCatalogResult%$'\n'*}"
    exit 1
fi

catalogs="${findCatalogResult%$'\n'*}"
echo "${catalogs}" > "${CATALOGS_TEMP_FILE}" #save templates to a temporary file

####################################################################
#       Delete Catalog Entries
####################################################################

echo ""
for catalog_file in $catalog_list
do
    catalog=$(<$catalog_file) #Read template file
    echo "Read file ${catalog_file}"
    catalogId=$(find_template_id "$catalog_file" "${CATALOGS_TEMP_FILE}")
    if [ ! -z "$catalogId" ]
    then
      deleteCatalogResult=$(curl -k -X DELETE "${CATALOG_SERVICE_ENDPOINT}/${catalogId}" -H "${HEADER_CONTENT_TYPE_JSON}" -H "${AUTHORIZATION_HEADER}" --write-out "\n%{http_code}" --silent)
      deleteCatalogStatus="${deleteCatalogResult##*$'\n'}"
      if [ "$deleteCatalogStatus" -eq 200 ]
      then
          echo "Successfully deleted catalog with id ${catalogId}. File: ${catalog_file}."
      else
          echo "Error deleting catalog ${catalogId}. File: ${catalog_file}. Status: ${deleteCatalogStatus}. Error: ${deleteCatalogResult%$'\n'*}"
          exit 1
      fi
    fi
done


####################################################################
#       Import Catalog Entries
####################################################################

echo ""
for catalog_file in $catalog_list
do
    result=$(write_temp_catalog "${catalog_file}" "${CATALOG_TEMP_FILE}" "${GITURL}" "${GITTOKEN}" "${BRANCH}")
    catalogContent=$(<${CATALOG_TEMP_FILE}) #Read Catalog file
    createCatalogResult=$(curl -k -X POST "${CATALOG_SERVICE_ENDPOINT}" -H "${HEADER_CONTENT_TYPE_JSON}" -H "${AUTHORIZATION_HEADER}" -d "${catalogContent}" --write-out "\n%{http_code}" --silent)
    createCatalogStatus="${createCatalogResult##*$'\n'}"
    if [ "$createCatalogStatus" -eq 200 ]
    then
        echo "Successfully created catalog with file ${catalog_file}"
    else
        echo "Error creating catalog with file ${catalog_file}. Status: ${createCatalogStatus}. Error: ${createCatalogResult%$'\n'*}"
        exit 1
    fi
done

rm $TEMPLATES_TEMP_FILE
rm $CATALOGS_TEMP_FILE
rm $CATALOG_TEMP_FILE
