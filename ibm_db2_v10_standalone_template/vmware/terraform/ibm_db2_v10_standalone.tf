##############################################################
# Licensed Materials - Property of IBM
#
# For use by authorized subscribers only.
#
# Refer to Service Description and SLA available here:
# http://www-03.ibm.com/software/sla/sladb.nsf/sla/saas
#
# D0021ZX IBM Cloud Automation Library, Enterprise Middleware
# © Copyright IBM Corp. 2017
##############################################################

# This is a terraform generated template generated from ibm_db2_v10_standalone

##############################################################
# Keys - CAMC (public/private) & optional User Key (public) 
##############################################################
variable "user_public_ssh_key" {
  type = "string"
  description = "User defined public SSH key used to connect to the virtual machine, whose format is required to be the openSSH key format with optional comment"
}

variable "ibm_pm_public_ssh_key" {
  description = "Public CAMC SSH key value which is used to connect to a guest, used on VMWare only."
}

variable "ibm_pm_private_ssh_key" {
  description = "Private CAMC SSH key (base64 encoded) used to connect to the virtual guest."
}

variable "allow_unverified_ssl" {
  description = "Communication with vsphere server with self signed certificate"
}

##############################################################
# Define the vsphere provider 
##############################################################
provider "vsphere" {
  allow_unverified_ssl = "${var.allow_unverified_ssl}"
}

resource "random_id" "stack_id" {
  byte_length = "16"
}

##############################################################
# Define pattern variables 
##############################################################
##### unique stack name #####
variable "ibm_stack_name" {
  description = "A unique stack name."
}

#### Default OS Admin User Map ####

##### DB2Node01 variables #####
#Variable : DB2Node01-image
variable "DB2Node01-image" {
  type = "string"
  description = "Operating system image id / template that should be used when creating the virtual image"
}

#Variable : DB2Node01-name
variable "DB2Node01-name" {
  type = "string"
  description = "Short Hostname of virtual machine"
}

#Variable : DB2Node01-os_admin_user
variable "DB2Node01-os_admin_user" {
  type = "string"
  description = "Name of admin user account in virtual machine to be SSHed into; Please refer to the documents from OS image vendors to obtain the default admin users"
}

#Variable : DB2Node01_db2_base_version
variable "DB2Node01_db2_base_version" {
  type = "string"
  description = "The base version of DB2 to install. Set to none if installing from fix package."
}

#Variable : DB2Node01_db2_das_password
variable "DB2Node01_db2_das_password" {
  type = "string"
  description = "DB2 Administration Server (DAS) password"
}

#Variable : DB2Node01_db2_das_username
variable "DB2Node01_db2_das_username" {
  type = "string"
  description = "DB2 Administration Server (DAS) username"
}

#Variable : DB2Node01_db2_fp_version
variable "DB2Node01_db2_fp_version" {
  type = "string"
  description = "The version of DB2 fix pack to install. If no fix pack is required, set this value the same as DB2 base version."
}

#Variable : DB2Node01_db2_instances_instance1_databases_database1_codeset
variable "DB2Node01_db2_instances_instance1_databases_database1_codeset" {
  type = "string"
  description = "Codeset is used by the database manager to determine codepage parameter values."
}

#Variable : DB2Node01_db2_instances_instance1_databases_database1_database_update_FAILARCHPATH
variable "DB2Node01_db2_instances_instance1_databases_database1_database_update_FAILARCHPATH" {
  type = "string"
  description = "The path to be used for archiving log files."
}

#Variable : DB2Node01_db2_instances_instance1_databases_database1_database_update_LOGARCHMETH1
variable "DB2Node01_db2_instances_instance1_databases_database1_database_update_LOGARCHMETH1" {
  type = "string"
  description = "Specifies the media type of the primary destination for logs that are archived."
}

#Variable : DB2Node01_db2_instances_instance1_databases_database1_database_update_LOGFILSIZ
variable "DB2Node01_db2_instances_instance1_databases_database1_database_update_LOGFILSIZ" {
  type = "string"
  description = "Specifies the size of log files."
}

#Variable : DB2Node01_db2_instances_instance1_databases_database1_database_update_LOGSECOND
variable "DB2Node01_db2_instances_instance1_databases_database1_database_update_LOGSECOND" {
  type = "string"
  description = "Specifies the number of secondary log files that are created and used for recovery log files."
}

#Variable : DB2Node01_db2_instances_instance1_databases_database1_database_update_NEWLOGPATH
variable "DB2Node01_db2_instances_instance1_databases_database1_database_update_NEWLOGPATH" {
  type = "string"
  description = "The path to be used for database logging."
}

#Variable : DB2Node01_db2_instances_instance1_databases_database1_database_users_db_user1_ldap_user
variable "DB2Node01_db2_instances_instance1_databases_database1_database_users_db_user1_ldap_user" {
  type = "string"
  description = "Specifies if user is in LDAP."
}

#Variable : DB2Node01_db2_instances_instance1_databases_database1_database_users_db_user1_user_access
variable "DB2Node01_db2_instances_instance1_databases_database1_database_users_db_user1_user_access" {
  type = "string"
  description = "Database access to be granted. Example: DBADM WITH DATAACCESS WITHOUT ACCESSCTRL"
}

#Variable : DB2Node01_db2_instances_instance1_databases_database1_database_users_db_user1_user_gid
variable "DB2Node01_db2_instances_instance1_databases_database1_database_users_db_user1_user_gid" {
  type = "string"
  description = "Specifies the name of the Operating System group for database users."
}

#Variable : DB2Node01_db2_instances_instance1_databases_database1_database_users_db_user1_user_name
variable "DB2Node01_db2_instances_instance1_databases_database1_database_users_db_user1_user_name" {
  type = "string"
  description = "A user name to be granted database access."
}

#Variable : DB2Node01_db2_instances_instance1_databases_database1_database_users_db_user1_user_password
variable "DB2Node01_db2_instances_instance1_databases_database1_database_users_db_user1_user_password" {
  type = "string"
  description = "The password for the datbase user name"
}

#Variable : DB2Node01_db2_instances_instance1_databases_database1_db_collate
variable "DB2Node01_db2_instances_instance1_databases_database1_db_collate" {
  type = "string"
  description = "Collate determines ordering for a set of characters."
}

#Variable : DB2Node01_db2_instances_instance1_databases_database1_db_data_path
variable "DB2Node01_db2_instances_instance1_databases_database1_db_data_path" {
  type = "string"
  description = "Specifies the DB2 database data path."
}

#Variable : DB2Node01_db2_instances_instance1_databases_database1_db_name
variable "DB2Node01_db2_instances_instance1_databases_database1_db_name" {
  type = "string"
  description = "The name of the database to be created."
}

#Variable : DB2Node01_db2_instances_instance1_databases_database1_db_path
variable "DB2Node01_db2_instances_instance1_databases_database1_db_path" {
  type = "string"
  description = "Specifies the DB2 database path."
}

#Variable : DB2Node01_db2_instances_instance1_databases_database1_pagesize
variable "DB2Node01_db2_instances_instance1_databases_database1_pagesize" {
  type = "string"
  description = "Specifies the page size in bytes."
}

#Variable : DB2Node01_db2_instances_instance1_databases_database1_territory
variable "DB2Node01_db2_instances_instance1_databases_database1_territory" {
  type = "string"
  description = "Territory is used by the database manager when processing data that is territory sensitive."
}

#Variable : DB2Node01_db2_instances_instance1_fcm_port
variable "DB2Node01_db2_instances_instance1_fcm_port" {
  type = "string"
  description = "The port for the DB2 Fast Communications Manager (FCM)."
}

#Variable : DB2Node01_db2_instances_instance1_fenced_groupname
variable "DB2Node01_db2_instances_instance1_fenced_groupname" {
  type = "string"
  description = "The group name for the DB2 fenced user."
}

#Variable : DB2Node01_db2_instances_instance1_fenced_password
variable "DB2Node01_db2_instances_instance1_fenced_password" {
  type = "string"
  description = "The password for the DB2 fenced username."
}

#Variable : DB2Node01_db2_instances_instance1_fenced_username
variable "DB2Node01_db2_instances_instance1_fenced_username" {
  type = "string"
  description = "The fenced user is used to run user defined functions and stored procedures outside of the address space used by the DB2 database."
}

#Variable : DB2Node01_db2_instances_instance1_instance_dir
variable "DB2Node01_db2_instances_instance1_instance_dir" {
  type = "string"
  description = "The DB2 instance directory stores all information that pertains to a database instance."
}

#Variable : DB2Node01_db2_instances_instance1_instance_groupname
variable "DB2Node01_db2_instances_instance1_instance_groupname" {
  type = "string"
  description = "The group name for the DB2 instance user."
}

#Variable : DB2Node01_db2_instances_instance1_instance_password
variable "DB2Node01_db2_instances_instance1_instance_password" {
  type = "string"
  description = "The password for the DB2 instance username."
}

#Variable : DB2Node01_db2_instances_instance1_instance_prefix
variable "DB2Node01_db2_instances_instance1_instance_prefix" {
  type = "string"
  description = "Specifies the DB2 instance prefix"
}

#Variable : DB2Node01_db2_instances_instance1_instance_type
variable "DB2Node01_db2_instances_instance1_instance_type" {
  type = "string"
  description = "The type of DB2 instance to create."
}

#Variable : DB2Node01_db2_instances_instance1_instance_username
variable "DB2Node01_db2_instances_instance1_instance_username" {
  type = "string"
  description = "The DB2 instance username controls all DB2 processes and owns all filesystems and devices."
}

#Variable : DB2Node01_db2_instances_instance1_port
variable "DB2Node01_db2_instances_instance1_port" {
  type = "string"
  description = "The port to connect to the DB2 instance."
}


##### Environment variables #####
#Variable : ibm_pm_access_token
variable "ibm_pm_access_token" {
  type = "string"
  description = "IBM Pattern Manager Access Token"
}

#Variable : ibm_pm_service
variable "ibm_pm_service" {
  type = "string"
  description = "IBM Pattern Manager Service"
}

#Variable : ibm_sw_repo
variable "ibm_sw_repo" {
  type = "string"
  description = "IBM Software Repo Root (https://<hostname>:<port>)"
}

#Variable : ibm_sw_repo_password
variable "ibm_sw_repo_password" {
  type = "string"
  description = "IBM Software Repo Password"
}

#Variable : ibm_sw_repo_user
variable "ibm_sw_repo_user" {
  type = "string"
  description = "IBM Software Repo Username"
}


#########################################################
##### Resource : DB2Node01
#########################################################

variable "DB2Node01-os_password" {
  type = "string"
  description = "Operating System Password for the Operating System User to access virtual machine"
}

variable "DB2Node01_folder" {
  description = "Target vSphere folder for virtual machine"
}

variable "DB2Node01_datacenter" {
  description = "Target vSphere Datacenter for virtual machine creation"
}

variable "DB2Node01_number_of_vcpu" {
  description = "Number of virtual CPU for the virtual machine, which is required to be a positive Integer"
}

variable "DB2Node01_memory" {
  description = "Memory for virtual machine in MBs, which is required to be one or more times of 1024"
}

variable "DB2Node01_cluster" {
  description = "Target vSphere cluster to host the virtual machine"
}

variable "DB2Node01_dns_suffixes" {
  type = "list"
  description = "Name resolution suffixes for the virtual network adapter"
}

variable "DB2Node01_dns_servers" {
  type = "list"
  description = "DNS servers for the virtual network adapter"
}

variable "DB2Node01_network_interface_label" {
  description = "vSphere port group or network label for virtual machine's vNIC"
}

variable "DB2Node01_ipv4_gateway" {
  description = "IPv4 gateway for vNIC configuration"
}

variable "DB2Node01_ipv4_address" {
  description = "IPv4 address for vNIC configuration"
}

variable "DB2Node01_ipv4_prefix_length" {
  description = "IPv4 Prefix length for vNIC configuration, which is required to be numbers between 8 and 32"
}

variable "DB2Node01_root_disk_datastore" {
  description = "Data store or storage cluster name for target virtual machine's disks"
}

variable "DB2Node01_root_disk_type" {
  type = "string"
  description = "Type of template disk volume"
}

variable "DB2Node01_root_disk_controller_type" {
  type = "string"
  description = "Type of template disk controller"
}

variable "DB2Node01_root_disk_keep_on_remove" {
  type = "string"
  description = "Delete template disk volume when the virtual machine is deleted"
}

# vsphere vm
resource "vsphere_virtual_machine" "DB2Node01" {
  name = "${var.DB2Node01-name}"
  folder = "${var.DB2Node01_folder}"
  datacenter = "${var.DB2Node01_datacenter}"
  vcpu = "${var.DB2Node01_number_of_vcpu}"
  memory = "${var.DB2Node01_memory}"
  cluster = "${var.DB2Node01_cluster}"
  dns_suffixes = "${var.DB2Node01_dns_suffixes}"
  dns_servers = "${var.DB2Node01_dns_servers}"

  network_interface {
    label = "${var.DB2Node01_network_interface_label}"
    ipv4_gateway = "${var.DB2Node01_ipv4_gateway}"
    ipv4_address = "${var.DB2Node01_ipv4_address}"
    ipv4_prefix_length = "${var.DB2Node01_ipv4_prefix_length}"
  }

  disk {
    type = "${var.DB2Node01_root_disk_type}"
    template = "${var.DB2Node01-image}"
    datastore = "${var.DB2Node01_root_disk_datastore}"
    keep_on_remove = "${var.DB2Node01_root_disk_keep_on_remove}"
    controller_type = "${var.DB2Node01_root_disk_controller_type}"
  }

  # Specify the connection
  connection {
    type = "ssh"
    user = "${var.DB2Node01-os_admin_user}"
    password = "${var.DB2Node01-os_password}"
  }

  provisioner "file" {
    destination = "DB2Node01_add_ssh_key.sh"
    content     = <<EOF
##############################################################
# Licensed Materials - Property of IBM
#
# For use by authorized subscribers only.
#
# Refer to Service Description and SLA available here:
# http://www-03.ibm.com/software/sla/sladb.nsf/sla/saas
#
# D0021ZX IBM Cloud Automation Library, Enterprise Middleware
# © Copyright IBM Corp. 2017
##############################################################
#!/bin/bash

if (( $# != 3 )); then
echo "usage: arg 1 is user, arg 2 is public key, arg3 is CAMC Public Key"
exit -1
fi

userid="$1"
ssh_key="$2"
camc_ssh_key="$3"

user_home=$(eval echo "~$userid")
user_auth_key_file=$user_home/.ssh/authorized_keys
echo "$user_auth_key_file"
if ! [ -f $user_auth_key_file ]; then
echo "$user_auth_key_file does not exist on this system, creating."
mkdir $user_home/.ssh
chmod 600 $user_home/.ssh
echo "" > $user_home/.ssh/authorized_keys
chmod 600 $user_home/.ssh/authorized_keys
else
echo "user_home : $user_home"
fi

if [[ $ssh_key = 'None' ]]; then
echo "skipping user key add, 'None' specified"
else
echo "$user_auth_key_file"
echo "$ssh_key" >> "$user_auth_key_file"
if [ $? -ne 0 ]; then
echo "failed to add to $user_auth_key_file"
exit -1
else
echo "updated $user_auth_key_file"
fi
fi

echo "$camc_ssh_key" >> "$user_auth_key_file"
if [ $? -ne 0 ]; then
echo "failed to add to $user_auth_key_file"
exit -1
else
echo "updated $user_auth_key_file"
fi

EOF
  }

  # Execute the script remotely
  provisioner "remote-exec" {
    inline = [
      "sudo bash -c 'chmod +x DB2Node01_add_ssh_key.sh'",
      "sudo bash -c './DB2Node01_add_ssh_key.sh  \"${var.DB2Node01-os_admin_user}\" \"${var.user_public_ssh_key}\" \"${var.ibm_pm_public_ssh_key}\">> DB2Node01_add_ssh_key.log 2>&1'"
    ]
  }

}

#########################################################
##### Resource : DB2Node01_chef_bootstrap_comp
#########################################################

resource "camc_bootstrap" "DB2Node01_chef_bootstrap_comp" {
  depends_on = ["camc_vaultitem.VaultItem","vsphere_virtual_machine.DB2Node01"]
  name = "DB2Node01_chef_bootstrap_comp"
  camc_endpoint = "${var.ibm_pm_service}/v1/bootstrap/chef"
  access_token = "${var.ibm_pm_access_token}"
  skip_ssl_verify = true
  trace = true
  data = <<EOT
{
  "os_admin_user": "${var.DB2Node01-os_admin_user}",
  "stack_id": "${random_id.stack_id.hex}",
  "environment_name": "_default",
  "host_ip": "${vsphere_virtual_machine.DB2Node01.network_interface.0.ipv4_address}",
  "node_name": "${var.DB2Node01-name}",
  "node_attributes": {
    "ibm_internal": {
      "stack_id": "${random_id.stack_id.hex}",
      "stack_name": "${var.ibm_stack_name}",
      "vault": {
        "item": "secrets",
        "name": "${random_id.stack_id.hex}"
      }
    }
  }
}
EOT
}


#########################################################
##### Resource : DB2Node01_db2_create_db
#########################################################

resource "camc_softwaredeploy" "DB2Node01_db2_create_db" {
  depends_on = ["camc_softwaredeploy.DB2Node01_db2_v105_install"]
  name = "DB2Node01_db2_create_db"
  camc_endpoint = "${var.ibm_pm_service}/v1/software_deployment/chef"
  access_token = "${var.ibm_pm_access_token}"
  skip_ssl_verify = true
  trace = true
  data = <<EOT
{
  "os_admin_user": "${var.DB2Node01-os_admin_user}",
  "stack_id": "${random_id.stack_id.hex}",
  "environment_name": "_default",
  "host_ip": "${vsphere_virtual_machine.DB2Node01.network_interface.0.ipv4_address}",
  "node_name": "${var.DB2Node01-name}",
  "runlist": "role[db2_create_db]",
  "node_attributes": {
    "db2": {
      "instances": {
        "instance1": {
          "databases": {
            "database1": {
              "codeset": "${var.DB2Node01_db2_instances_instance1_databases_database1_codeset}",
              "database_update": {
                "FAILARCHPATH": "${var.DB2Node01_db2_instances_instance1_databases_database1_database_update_FAILARCHPATH}",
                "LOGARCHMETH1": "${var.DB2Node01_db2_instances_instance1_databases_database1_database_update_LOGARCHMETH1}",
                "LOGFILSIZ": "${var.DB2Node01_db2_instances_instance1_databases_database1_database_update_LOGFILSIZ}",
                "LOGSECOND": "${var.DB2Node01_db2_instances_instance1_databases_database1_database_update_LOGSECOND}",
                "NEWLOGPATH": "${var.DB2Node01_db2_instances_instance1_databases_database1_database_update_NEWLOGPATH}"
              },
              "database_users": {
                "db_user1": {
                  "ldap_user": "${var.DB2Node01_db2_instances_instance1_databases_database1_database_users_db_user1_ldap_user}",
                  "user_access": "${var.DB2Node01_db2_instances_instance1_databases_database1_database_users_db_user1_user_access}",
                  "user_gid": "${var.DB2Node01_db2_instances_instance1_databases_database1_database_users_db_user1_user_gid}",
                  "user_home": "default",
                  "user_name": "${var.DB2Node01_db2_instances_instance1_databases_database1_database_users_db_user1_user_name}"
                }
              },
              "db_collate": "${var.DB2Node01_db2_instances_instance1_databases_database1_db_collate}",
              "db_data_path": "${var.DB2Node01_db2_instances_instance1_databases_database1_db_data_path}",
              "db_name": "${var.DB2Node01_db2_instances_instance1_databases_database1_db_name}",
              "db_path": "${var.DB2Node01_db2_instances_instance1_databases_database1_db_path}",
              "pagesize": "${var.DB2Node01_db2_instances_instance1_databases_database1_pagesize}",
              "territory": "${var.DB2Node01_db2_instances_instance1_databases_database1_territory}"
            }
          },
          "fcm_port": "${var.DB2Node01_db2_instances_instance1_fcm_port}",
          "fenced_groupname": "${var.DB2Node01_db2_instances_instance1_fenced_groupname}",
          "fenced_username": "${var.DB2Node01_db2_instances_instance1_fenced_username}",
          "instance_dir": "${var.DB2Node01_db2_instances_instance1_instance_dir}",
          "instance_groupname": "${var.DB2Node01_db2_instances_instance1_instance_groupname}",
          "instance_prefix": "${var.DB2Node01_db2_instances_instance1_instance_prefix}",
          "instance_type": "${var.DB2Node01_db2_instances_instance1_instance_type}",
          "instance_username": "${var.DB2Node01_db2_instances_instance1_instance_username}",
          "port": "${var.DB2Node01_db2_instances_instance1_port}"
        }
      }
    },
    "ibm_internal": {
      "roles": "[db2_create_db]"
    }
  },
  "vault_content": {
    "item": "secrets",
    "values": {
      "db2": {
        "instances": {
          "instance1": {
            "databases": {
              "database1": {
                "database_users": {
                  "db_user1": {
                    "user_password": "${var.DB2Node01_db2_instances_instance1_databases_database1_database_users_db_user1_user_password}"
                  }
                }
              }
            },
            "fenced_password": "${var.DB2Node01_db2_instances_instance1_fenced_password}",
            "instance_password": "${var.DB2Node01_db2_instances_instance1_instance_password}"
          }
        }
      }
    },
    "vault": "${random_id.stack_id.hex}"
  }
}
EOT
}


#########################################################
##### Resource : DB2Node01_db2_v105_install
#########################################################

resource "camc_softwaredeploy" "DB2Node01_db2_v105_install" {
  depends_on = ["camc_bootstrap.DB2Node01_chef_bootstrap_comp"]
  name = "DB2Node01_db2_v105_install"
  camc_endpoint = "${var.ibm_pm_service}/v1/software_deployment/chef"
  access_token = "${var.ibm_pm_access_token}"
  skip_ssl_verify = true
  trace = true
  data = <<EOT
{
  "os_admin_user": "${var.DB2Node01-os_admin_user}",
  "stack_id": "${random_id.stack_id.hex}",
  "environment_name": "_default",
  "host_ip": "${vsphere_virtual_machine.DB2Node01.network_interface.0.ipv4_address}",
  "node_name": "${var.DB2Node01-name}",
  "runlist": "role[db2_v105_install]",
  "node_attributes": {
    "db2": {
      "base_version": "${var.DB2Node01_db2_base_version}",
      "das_username": "${var.DB2Node01_db2_das_username}",
      "fp_version": "${var.DB2Node01_db2_fp_version}"
    },
    "ibm": {
      "sw_repo": "${var.ibm_sw_repo}",
      "sw_repo_auth": "true",
      "sw_repo_self_signed_cert": "true",
      "sw_repo_user": "${var.ibm_sw_repo_user}"
    },
    "ibm_internal": {
      "roles": "[db2_v105_install]"
    }
  },
  "vault_content": {
    "item": "secrets",
    "values": {
      "db2": {
        "das_password": "${var.DB2Node01_db2_das_password}"
      },
      "ibm": {
        "sw_repo_password": "${var.ibm_sw_repo_password}"
      }
    },
    "vault": "${random_id.stack_id.hex}"
  }
}
EOT
}


#########################################################
##### Resource : VaultItem
#########################################################

resource "camc_vaultitem" "VaultItem" {
  camc_endpoint = "${var.ibm_pm_service}/v1/vault_item/chef"
  access_token = "${var.ibm_pm_access_token}"
  skip_ssl_verify = true
  trace = true
  data = <<EOT
{
  "vault_content": {
    "item": "secrets",
    "values": {},
    "vault": "${random_id.stack_id.hex}"
  }
}
EOT
}

output "DB2Node01_ip" {
  value = "VM IP Address : ${vsphere_virtual_machine.DB2Node01.network_interface.0.ipv4_address}"
}

output "DB2Node01_name" {
  value = "${var.DB2Node01-name}"
}

output "DB2Node01_roles" {
  value = "db2_create_db,db2_v105_install"
}

output "stack_id" {
  value = "${random_id.stack_id.hex}"
}

