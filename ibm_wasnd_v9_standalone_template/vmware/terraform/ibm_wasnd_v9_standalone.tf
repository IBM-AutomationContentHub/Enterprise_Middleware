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

# This is a terraform generated template generated from ibm_wasnd_v9_standalone

##############################################################
# Keys - CAMC (public/private) & optional User Key (public)
##############################################################
variable "user_public_ssh_key" {
  type        = "string"
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

##### Environment variables #####
#Variable : ibm_im_repo
variable "ibm_im_repo" {
  type        = "string"
  description = "IBM Software  Installation Manager Repository URL (https://<hostname/IP>:<port>/IMRepo) "
}

#Variable : ibm_im_repo_password
variable "ibm_im_repo_password" {
  type        = "string"
  description = "IBM Software  Installation Manager Repository Password"
}

#Variable : ibm_im_repo_user
variable "ibm_im_repo_user" {
  type        = "string"
  description = "IBM Software  Installation Manager Repository username"
}

#Variable : ibm_pm_access_token
variable "ibm_pm_access_token" {
  type        = "string"
  description = "IBM Pattern Manager Access Token"
}

#Variable : ibm_pm_service
variable "ibm_pm_service" {
  type        = "string"
  description = "IBM Pattern Manager Service"
}

#Variable : ibm_sw_repo
variable "ibm_sw_repo" {
  type        = "string"
  description = "IBM Software Repo Root (https://<hostname>:<port>)"
}

#Variable : ibm_sw_repo_password
variable "ibm_sw_repo_password" {
  type        = "string"
  description = "IBM Software Repo Password"
}

#Variable : ibm_sw_repo_user
variable "ibm_sw_repo_user" {
  type        = "string"
  description = "IBM Software Repo Username"
}

#Variable : was_profiles_standalone_profiles_standalone1_keystorepassword
variable "was_profiles_standalone_profiles_standalone1_keystorepassword" {
  type        = "string"
  description = "Specifies the password to use on all keystore files created during profile creation"
}

#Variable : was_security_admin_user_pwd
variable "was_security_admin_user_pwd" {
  type        = "string"
  description = "The password for the WebSphere administrative account"
}

##### WASNode01 variables #####
#Variable : WASNode01-image
variable "WASNode01-image" {
  type        = "string"
  description = "Operating system image id / template that should be used when creating the virtual image"
}

#Variable : WASNode01-name
variable "WASNode01-name" {
  type        = "string"
  description = "Short Hostname of virtual machine"
}

#Variable : WASNode01-os_admin_user
variable "WASNode01-os_admin_user" {
  type        = "string"
  description = "Name of admin user account in virtual machine to be SSHed into; Please refer to the documents from OS image vendors to obtain the default admin users"
}

#Variable : WASNode01_was_install_dir
variable "WASNode01_was_install_dir" {
  type        = "string"
  description = "The installation root directory for the WebSphere Application Server product binaries"
}

#Variable : WASNode01_was_java_version
variable "WASNode01_was_java_version" {
  type        = "string"
  description = "The Java SDK version that should be installed with the WebSphere Application Server. Example format is 8.0.4.70"
}

#Variable : WASNode01_was_os_users_was_gid
variable "WASNode01_was_os_users_was_gid" {
  type        = "string"
  description = "Operating System group name that will be assigned to the product installation"
}

#Variable : WASNode01_was_os_users_was_home
variable "WASNode01_was_os_users_was_home" {
  type        = "string"
  description = "Home directory location for operating system user that is used for product installation"
}

#Variable : WASNode01_was_os_users_was_ldap_user
variable "WASNode01_was_os_users_was_ldap_user" {
  type        = "string"
  description = "Use LDAP to authenticate operating system account on Linux logins"
}

#Variable : WASNode01_was_os_users_was_name
variable "WASNode01_was_os_users_was_name" {
  type        = "string"
  description = "Operating system userid that will be used to install the product. Userid will be created if it does not exist"
}

#Variable : WASNode01_was_profile_dir
variable "WASNode01_was_profile_dir" {
  type        = "string"
  description = "The directory path that contains WebSphere Application Server profiles"
}

#Variable : WASNode01_was_profiles_standalone_profiles_standalone1_cell
variable "WASNode01_was_profiles_standalone_profiles_standalone1_cell" {
  type        = "string"
  description = "Cell name for the application server"
}

#Variable : WASNode01_was_profiles_standalone_profiles_standalone1_profile
variable "WASNode01_was_profiles_standalone_profiles_standalone1_profile" {
  type        = "string"
  description = "Application server profile name"
}

#Variable : WASNode01_was_profiles_standalone_profiles_standalone1_server
variable "WASNode01_was_profiles_standalone_profiles_standalone1_server" {
  type        = "string"
  description = "Name of the application server"
}

#Variable : WASNode01_was_security_admin_user
variable "WASNode01_was_security_admin_user" {
  type        = "string"
  description = "The username for securing the WebSphere adminstrative console"
}

#Variable : WASNode01_was_version
variable "WASNode01_was_version" {
  type        = "string"
  description = "The release and fixpack level of WebSphere Application Server to be installed. Example formats are 8.5.5.11 or 9.0.0.4"
}

#Variable : WASNode01_was_wsadmin_standalone_jvmproperty_property_value_initial
variable "WASNode01_was_wsadmin_standalone_jvmproperty_property_value_initial" {
  type        = "string"
  description = "Minimum JVM heap size"
}

#Variable : WASNode01_was_wsadmin_standalone_jvmproperty_property_value_maximum
variable "WASNode01_was_wsadmin_standalone_jvmproperty_property_value_maximum" {
  type        = "string"
  description = "Maximum JVM heap size"
}

#########################################################
##### Resource : VaultItem
#########################################################

resource "camc_vaultitem" "VaultItem" {
  camc_endpoint   = "${var.ibm_pm_service}/v1/vault_item/chef"
  access_token    = "${var.ibm_pm_access_token}"
  skip_ssl_verify = true
  trace           = true

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

#########################################################
##### Resource : WASNode01
#########################################################

variable "WASNode01-os_password" {
  type        = "string"
  description = "Operating System Password for the Operating System User to access virtual machine"
}

variable "WASNode01_folder" {
  description = "Target vSphere folder for virtual machine"
}

variable "WASNode01_datacenter" {
  description = "Target vSphere Datacenter for virtual machine creation"
}

variable "WASNode01_number_of_vcpu" {
  description = "Number of virtual CPU for the virtual machine, which is required to be a positive Integer"
}

variable "WASNode01_memory" {
  description = "Memory for virtual machine in MBs, which is required to be one or more times of 1024"
}

variable "WASNode01_cluster" {
  description = "Target vSphere cluster to host the virtual machine"
}

variable "WASNode01_dns_suffixes" {
  type        = "list"
  description = "Name resolution suffixes for the virtual network adapter"
}

variable "WASNode01_dns_servers" {
  type        = "list"
  description = "DNS servers for the virtual network adapter"
}

variable "WASNode01_network_interface_label" {
  description = "vSphere port group or network label for virtual machine's vNIC"
}

variable "WASNode01_ipv4_gateway" {
  description = "IPv4 gateway for vNIC configuration"
}

variable "WASNode01_ipv4_address" {
  description = "IPv4 address for vNIC configuration"
}

variable "WASNode01_ipv4_prefix_length" {
  description = "IPv4 Prefix length for vNIC configuration, which is required to be numbers between 8 and 32"
}

variable "WASNode01_root_disk_datastore" {
  description = "Data store or storage cluster name for target virtual machine's disks"
}

variable "WASNode01_root_disk_type" {
  type        = "string"
  description = "Type of template disk volume"
}

variable "WASNode01_root_disk_controller_type" {
  type        = "string"
  description = "Type of template disk controller"
}

variable "WASNode01_root_disk_keep_on_remove" {
  type        = "string"
  description = "Delete template disk volume when the virtual machine is deleted"
}

# vsphere vm
resource "vsphere_virtual_machine" "WASNode01" {
  name         = "${var.WASNode01-name}"
  folder       = "${var.WASNode01_folder}"
  datacenter   = "${var.WASNode01_datacenter}"
  vcpu         = "${var.WASNode01_number_of_vcpu}"
  memory       = "${var.WASNode01_memory}"
  cluster      = "${var.WASNode01_cluster}"
  dns_suffixes = "${var.WASNode01_dns_suffixes}"
  dns_servers  = "${var.WASNode01_dns_servers}"

  network_interface {
    label              = "${var.WASNode01_network_interface_label}"
    ipv4_gateway       = "${var.WASNode01_ipv4_gateway}"
    ipv4_address       = "${var.WASNode01_ipv4_address}"
    ipv4_prefix_length = "${var.WASNode01_ipv4_prefix_length}"
  }

  disk {
    type            = "${var.WASNode01_root_disk_type}"
    template        = "${var.WASNode01-image}"
    datastore       = "${var.WASNode01_root_disk_datastore}"
    keep_on_remove  = "${var.WASNode01_root_disk_keep_on_remove}"
    controller_type = "${var.WASNode01_root_disk_controller_type}"
  }

  # Specify the connection
  connection {
    type     = "ssh"
    user     = "${var.WASNode01-os_admin_user}"
    password = "${var.WASNode01-os_password}"
  }

  provisioner "file" {
    destination = "WASNode01_add_ssh_key.sh"

    content = <<EOF
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
      "sudo bash -c 'chmod +x WASNode01_add_ssh_key.sh'",
      "sudo bash -c './WASNode01_add_ssh_key.sh  \"${var.WASNode01-os_admin_user}\" \"${var.user_public_ssh_key}\" \"${var.ibm_pm_public_ssh_key}\">> WASNode01_add_ssh_key.log 2>&1'",
    ]
  }
}

#########################################################
##### Resource : WASNode01_chef_bootstrap_comp
#########################################################

resource "camc_bootstrap" "WASNode01_chef_bootstrap_comp" {
  depends_on      = ["camc_vaultitem.VaultItem", "vsphere_virtual_machine.WASNode01"]
  name            = "WASNode01_chef_bootstrap_comp"
  camc_endpoint   = "${var.ibm_pm_service}/v1/bootstrap/chef"
  access_token    = "${var.ibm_pm_access_token}"
  skip_ssl_verify = true
  trace           = true

  data = <<EOT
{
  "os_admin_user": "${var.WASNode01-os_admin_user}",
  "stack_id": "${random_id.stack_id.hex}",
  "environment_name": "_default",
  "host_ip": "${vsphere_virtual_machine.WASNode01.network_interface.0.ipv4_address}",
  "node_name": "${var.WASNode01-name}",
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
##### Resource : WASNode01_was_create_standalone
#########################################################

resource "camc_softwaredeploy" "WASNode01_was_create_standalone" {
  depends_on      = ["camc_softwaredeploy.WASNode01_was_v9_install"]
  name            = "WASNode01_was_create_standalone"
  camc_endpoint   = "${var.ibm_pm_service}/v1/software_deployment/chef"
  access_token    = "${var.ibm_pm_access_token}"
  skip_ssl_verify = true
  trace           = true

  data = <<EOT
{
  "os_admin_user": "${var.WASNode01-os_admin_user}",
  "stack_id": "${random_id.stack_id.hex}",
  "environment_name": "_default",
  "host_ip": "${vsphere_virtual_machine.WASNode01.network_interface.0.ipv4_address}",
  "node_name": "${var.WASNode01-name}",
  "runlist": "role[was_create_standalone]",
  "node_attributes": {
    "ibm_internal": {
      "roles": "[was_create_standalone]"
    },
    "was": {
      "profiles": {
        "standalone_profiles": {
          "standalone1": {
            "cell": "${var.WASNode01_was_profiles_standalone_profiles_standalone1_cell}",
            "profile": "${var.WASNode01_was_profiles_standalone_profiles_standalone1_profile}",
            "server": "${var.WASNode01_was_profiles_standalone_profiles_standalone1_server}"
          }
        }
      },
      "wsadmin": {
        "standalone": {
          "jvmproperty": {
            "property_value_initial": "${var.WASNode01_was_wsadmin_standalone_jvmproperty_property_value_initial}",
            "property_value_maximum": "${var.WASNode01_was_wsadmin_standalone_jvmproperty_property_value_maximum}"
          }
        }
      }
    }
  },
  "vault_content": {
    "item": "secrets",
    "values": {
      "was": {
        "profiles": {
          "standalone_profiles": {
            "standalone1": {
              "keystorepassword": "${var.was_profiles_standalone_profiles_standalone1_keystorepassword}"
            }
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
##### Resource : WASNode01_was_v9_install
#########################################################

resource "camc_softwaredeploy" "WASNode01_was_v9_install" {
  depends_on      = ["camc_bootstrap.WASNode01_chef_bootstrap_comp"]
  name            = "WASNode01_was_v9_install"
  camc_endpoint   = "${var.ibm_pm_service}/v1/software_deployment/chef"
  access_token    = "${var.ibm_pm_access_token}"
  skip_ssl_verify = true
  trace           = true

  data = <<EOT
{
  "os_admin_user": "${var.WASNode01-os_admin_user}",
  "stack_id": "${random_id.stack_id.hex}",
  "environment_name": "_default",
  "host_ip": "${vsphere_virtual_machine.WASNode01.network_interface.0.ipv4_address}",
  "node_name": "${var.WASNode01-name}",
  "runlist": "role[was_v9_install]",
  "node_attributes": {
    "ibm": {
      "im_repo": "${var.ibm_im_repo}",
      "im_repo_user": "${var.ibm_im_repo_user}",
      "sw_repo": "${var.ibm_sw_repo}",
      "sw_repo_user": "${var.ibm_sw_repo_user}"
    },
    "ibm_internal": {
      "roles": "[was_v9_install]"
    },
    "was": {
      "install_dir": "${var.WASNode01_was_install_dir}",
      "java_version": "${var.WASNode01_was_java_version}",
      "os_users": {
        "was": {
          "gid": "${var.WASNode01_was_os_users_was_gid}",
          "home": "${var.WASNode01_was_os_users_was_home}",
          "ldap_user": "${var.WASNode01_was_os_users_was_ldap_user}",
          "name": "${var.WASNode01_was_os_users_was_name}"
        }
      },
      "profile_dir": "${var.WASNode01_was_profile_dir}",
      "security": {
        "admin_user": "${var.WASNode01_was_security_admin_user}"
      },
      "version": "${var.WASNode01_was_version}"
    }
  },
  "vault_content": {
    "item": "secrets",
    "values": {
      "ibm": {
        "im_repo_password": "${var.ibm_im_repo_password}",
        "sw_repo_password": "${var.ibm_sw_repo_password}"
      },
      "was": {
        "security": {
          "admin_user_pwd": "${var.was_security_admin_user_pwd}"
        }
      }
    },
    "vault": "${random_id.stack_id.hex}"
  }
}
EOT
}

output "WASNode01_ip" {
  value = "VM IP Address : ${vsphere_virtual_machine.WASNode01.network_interface.0.ipv4_address}"
}

output "WASNode01_name" {
  value = "${var.WASNode01-name}"
}

output "WASNode01_roles" {
  value = "was_create_standalone,was_v9_install"
}

output "stack_id" {
  value = "${random_id.stack_id.hex}"
}
