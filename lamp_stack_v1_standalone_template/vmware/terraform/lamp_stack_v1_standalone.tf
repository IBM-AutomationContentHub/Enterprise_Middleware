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

# This is a terraform generated template generated from lamp_stack_v1_standalone

##############################################################
# Keys - CAMC (public/private) & optional User Key (public)
##############################################################
variable "user_public_ssh_key" {
  type        = "string"
  description = "User defined public SSH key used to connect to the virtual machine, whose format is required to be the openSSH key format with optional comment"
  default     = "None"
}

variable "ibm_pm_public_ssh_key" {
  description = "Public CAMC SSH key value which is used to connect to a guest, used on VMWare only."
}

variable "ibm_pm_private_ssh_key" {
  description = "Private CAMC SSH key (base64 encoded) used to connect to the virtual guest."
}

variable "allow_unverified_ssl" {
  description = "Communication with vsphere server with self signed certificate"
  default     = "true"
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
  default     = "repouser"
}

##### LAMPNode01 variables #####
#Variable : LAMPNode01-image
variable "LAMPNode01-image" {
  type        = "string"
  description = "Operating system image id / template that should be used when creating the virtual image"
}

#Variable : LAMPNode01-name
variable "LAMPNode01-name" {
  type        = "string"
  description = "Short Hostname of virtual machine"
}

#Variable : LAMPNode01-os_admin_user
variable "LAMPNode01-os_admin_user" {
  type        = "string"
  description = "Name of admin user account in virtual machine to be SSHed into; Please refer to the documents from OS image vendors to obtain the default admin users"
}

#Variable : LAMPNode01_httpd_listen
variable "LAMPNode01_httpd_listen" {
  type        = "string"
  description = "Listening port to be configured in HTTP server"
  default     = "8080"
}

#Variable : LAMPNode01_httpd_log_dir
variable "LAMPNode01_httpd_log_dir" {
  type        = "string"
  description = "Directory where HTTP Server logs will be sent"
  default     = "/var/log/httpd"
}

#Variable : LAMPNode01_httpd_os_users_web_content_owner_gid
variable "LAMPNode01_httpd_os_users_web_content_owner_gid" {
  type        = "string"
  description = "Group ID of web content owner to be configured in HTTP server"
  default     = "webmaster"
}

#Variable : LAMPNode01_httpd_os_users_web_content_owner_home
variable "LAMPNode01_httpd_os_users_web_content_owner_home" {
  type        = "string"
  description = "Home directory of web content owner to be configured in HTTP server"
  default     = "/home/webmaster"
}

#Variable : LAMPNode01_httpd_os_users_web_content_owner_ldap_user
variable "LAMPNode01_httpd_os_users_web_content_owner_ldap_user" {
  type        = "string"
  description = "Use LDAP to authenticate Web Content Owner account on Linux HTTP server as well as web site logins"
  default     = "false"
}

#Variable : LAMPNode01_httpd_os_users_web_content_owner_name
variable "LAMPNode01_httpd_os_users_web_content_owner_name" {
  type        = "string"
  description = "User ID of web content owner to be configured in HTTP server"
  default     = "webmaster"
}

#Variable : LAMPNode01_httpd_php_mod_enabled
variable "LAMPNode01_httpd_php_mod_enabled" {
  type        = "string"
  description = "Enable PHP in Apache on Linux by Loading the Module"
  default     = "true"
}

#Variable : LAMPNode01_httpd_vhosts_enabled
variable "LAMPNode01_httpd_vhosts_enabled" {
  type        = "string"
  description = "Allow to configure virtual hosts to run multiple websites on the same HTTP server"
  default     = "false"
}

#Variable : LAMPNode01_mysql_config_data_dir
variable "LAMPNode01_mysql_config_data_dir" {
  type        = "string"
  description = "Directory to store information managed by MySQL server"
  default     = "/var/lib/mysql"
}

#Variable : LAMPNode01_mysql_config_databases_database_1_database_name
variable "LAMPNode01_mysql_config_databases_database_1_database_name" {
  type        = "string"
  description = "Create a sample database in MySQL"
  default     = "default_database"
}

#Variable : LAMPNode01_mysql_config_databases_database_1_users_user_1_name
variable "LAMPNode01_mysql_config_databases_database_1_users_user_1_name" {
  type        = "string"
  description = "Name of the first user which is created and allowed to access the sample database created"
  default     = "defaultUser"
}

#Variable : LAMPNode01_mysql_config_databases_database_1_users_user_1_password
variable "LAMPNode01_mysql_config_databases_database_1_users_user_1_password" {
  type        = "string"
  description = "Password of the first user"
}

#Variable : LAMPNode01_mysql_config_databases_database_1_users_user_2_name
variable "LAMPNode01_mysql_config_databases_database_1_users_user_2_name" {
  type        = "string"
  description = "Name of the second user which is created and allowed to access the sample database created"
  default     = "defaultUser2"
}

#Variable : LAMPNode01_mysql_config_databases_database_1_users_user_2_password
variable "LAMPNode01_mysql_config_databases_database_1_users_user_2_password" {
  type        = "string"
  description = "Password of the second user"
}

#Variable : LAMPNode01_mysql_config_log_file
variable "LAMPNode01_mysql_config_log_file" {
  type        = "string"
  description = "Log file configured in MySQL"
  default     = "/var/log/mysqld.log"
}

#Variable : LAMPNode01_mysql_config_port
variable "LAMPNode01_mysql_config_port" {
  type        = "string"
  description = "Listening port to be configured in MySQL"
  default     = "3306"
}

#Variable : LAMPNode01_mysql_install_from_repo
variable "LAMPNode01_mysql_install_from_repo" {
  type        = "string"
  description = "Install MySQL from secure repository server or yum repo"
  default     = "true"
}

#Variable : LAMPNode01_mysql_os_users_daemon_gid
variable "LAMPNode01_mysql_os_users_daemon_gid" {
  type        = "string"
  description = "Group ID of the default OS user for MySQL to be configured in Linux server"
  default     = "mysql"
}

#Variable : LAMPNode01_mysql_os_users_daemon_home
variable "LAMPNode01_mysql_os_users_daemon_home" {
  type        = "string"
  description = "Home directory of the default OS user for MySQL to be configured in Linux server"
  default     = "/home/mysql"
}

#Variable : LAMPNode01_mysql_os_users_daemon_ldap_user
variable "LAMPNode01_mysql_os_users_daemon_ldap_user" {
  type        = "string"
  description = "Use  LDAP to authenticate the default OS user account on Linux server"
  default     = "false"
}

#Variable : LAMPNode01_mysql_os_users_daemon_name
variable "LAMPNode01_mysql_os_users_daemon_name" {
  type        = "string"
  description = "User ID of the default OS user for MySQL to be configured in Linux server"
  default     = "mysql"
}

#Variable : LAMPNode01_mysql_os_users_daemon_shell
variable "LAMPNode01_mysql_os_users_daemon_shell" {
  type        = "string"
  description = "Default shell configured on Linux server"
  default     = "/bin/bash"
}

#Variable : LAMPNode01_mysql_root_password
variable "LAMPNode01_mysql_root_password" {
  type        = "string"
  description = "Change the password of the MySQL root user"
}

#Variable : LAMPNode01_mysql_version
variable "LAMPNode01_mysql_version" {
  type        = "string"
  description = "MySQL Version to be installed"
  default     = "5.7.17"
}

#########################################################
##### Resource : LAMPNode01
#########################################################

variable "LAMPNode01-os_password" {
  type        = "string"
  description = "Operating System Password for the Operating System User to access virtual machine"
}

variable "LAMPNode01_folder" {
  description = "Target vSphere folder for virtual machine"
}

variable "LAMPNode01_datacenter" {
  description = "Target vSphere Datacenter for virtual machine creation"
}

variable "LAMPNode01_number_of_vcpu" {
  description = "Number of virtual CPU for the virtual machine, which is required to be a positive Integer"
  default     = "2"
}

variable "LAMPNode01_memory" {
  description = "Memory for virtual machine in MBs, which is required to be one or more times of 1024"
  default     = "4096"
}

variable "LAMPNode01_cluster" {
  description = "Target vSphere cluster to host the virtual machine"
}

variable "LAMPNode01_dns_suffixes" {
  type        = "list"
  description = "Name resolution suffixes for the virtual network adapter"
}

variable "LAMPNode01_dns_servers" {
  type        = "list"
  description = "DNS servers for the virtual network adapter"
}

variable "LAMPNode01_network_interface_label" {
  description = "vSphere port group or network label for virtual machine's vNIC"
}

variable "LAMPNode01_ipv4_gateway" {
  description = "IPv4 gateway for vNIC configuration"
}

variable "LAMPNode01_ipv4_address" {
  description = "IPv4 address for vNIC configuration"
}

variable "LAMPNode01_ipv4_prefix_length" {
  description = "IPv4 Prefix length for vNIC configuration, which is required to be numbers between 8 and 32"
}

variable "LAMPNode01_root_disk_datastore" {
  description = "Data store or storage cluster name for target virtual machine's disks"
}

variable "LAMPNode01_root_disk_type" {
  type        = "string"
  description = "Type of template disk volume"
  default     = "eager_zeroed"
}

variable "LAMPNode01_root_disk_controller_type" {
  type        = "string"
  description = "Type of template disk controller"
  default     = "scsi"
}

variable "LAMPNode01_root_disk_keep_on_remove" {
  type        = "string"
  description = "Delete template disk volume when the virtual machine is deleted"
  default     = "false"
}

# vsphere vm
resource "vsphere_virtual_machine" "LAMPNode01" {
  name         = "${var.LAMPNode01-name}"
  folder       = "${var.LAMPNode01_folder}"
  datacenter   = "${var.LAMPNode01_datacenter}"
  vcpu         = "${var.LAMPNode01_number_of_vcpu}"
  memory       = "${var.LAMPNode01_memory}"
  cluster      = "${var.LAMPNode01_cluster}"
  dns_suffixes = "${var.LAMPNode01_dns_suffixes}"
  dns_servers  = "${var.LAMPNode01_dns_servers}"

  network_interface {
    label              = "${var.LAMPNode01_network_interface_label}"
    ipv4_gateway       = "${var.LAMPNode01_ipv4_gateway}"
    ipv4_address       = "${var.LAMPNode01_ipv4_address}"
    ipv4_prefix_length = "${var.LAMPNode01_ipv4_prefix_length}"
  }

  disk {
    type            = "${var.LAMPNode01_root_disk_type}"
    template        = "${var.LAMPNode01-image}"
    datastore       = "${var.LAMPNode01_root_disk_datastore}"
    keep_on_remove  = "${var.LAMPNode01_root_disk_keep_on_remove}"
    controller_type = "${var.LAMPNode01_root_disk_controller_type}"
  }

  # Specify the connection
  connection {
    type     = "ssh"
    user     = "${var.LAMPNode01-os_admin_user}"
    password = "${var.LAMPNode01-os_password}"
  }

  provisioner "file" {
    destination = "LAMPNode01_add_ssh_key.sh"

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
      "sudo bash -c 'chmod +x LAMPNode01_add_ssh_key.sh'",
      "sudo bash -c './LAMPNode01_add_ssh_key.sh  \"${var.LAMPNode01-os_admin_user}\" \"${var.user_public_ssh_key}\" \"${var.ibm_pm_public_ssh_key}\">> LAMPNode01_add_ssh_key.log 2>&1'",
    ]
  }
}

#########################################################
##### Resource : LAMPNode01_chef_bootstrap_comp
#########################################################

resource "camc_bootstrap" "LAMPNode01_chef_bootstrap_comp" {
  depends_on      = ["camc_vaultitem.VaultItem", "vsphere_virtual_machine.LAMPNode01"]
  name            = "LAMPNode01_chef_bootstrap_comp"
  camc_endpoint   = "${var.ibm_pm_service}/v1/bootstrap/chef"
  access_token    = "${var.ibm_pm_access_token}"
  skip_ssl_verify = true
  trace           = true

  data = <<EOT
{
  "os_admin_user": "${var.LAMPNode01-os_admin_user}",
  "stack_id": "${random_id.stack_id.hex}",
  "environment_name": "_default",
  "host_ip": "${vsphere_virtual_machine.LAMPNode01.network_interface.0.ipv4_address}",
  "node_name": "${var.LAMPNode01-name}",
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
##### Resource : LAMPNode01_httpd24-base-install
#########################################################

resource "camc_softwaredeploy" "LAMPNode01_httpd24-base-install" {
  depends_on      = ["camc_softwaredeploy.LAMPNode01_oracle_mysql_base"]
  name            = "LAMPNode01_httpd24-base-install"
  camc_endpoint   = "${var.ibm_pm_service}/v1/software_deployment/chef"
  access_token    = "${var.ibm_pm_access_token}"
  skip_ssl_verify = true
  trace           = true

  data = <<EOT
{
  "os_admin_user": "${var.LAMPNode01-os_admin_user}",
  "stack_id": "${random_id.stack_id.hex}",
  "environment_name": "_default",
  "host_ip": "${vsphere_virtual_machine.LAMPNode01.network_interface.0.ipv4_address}",
  "node_name": "${var.LAMPNode01-name}",
  "runlist": "role[httpd24-base-install]",
  "node_attributes": {
    "httpd": {
      "data_dir_mode": "0755",
      "document_root": "/var/www/html5",
      "listen": "${var.LAMPNode01_httpd_listen}",
      "log_dir": "${var.LAMPNode01_httpd_log_dir}",
      "log_level": "info",
      "os_users": {
        "web_content_owner": {
          "gid": "${var.LAMPNode01_httpd_os_users_web_content_owner_gid}",
          "home": "${var.LAMPNode01_httpd_os_users_web_content_owner_home}",
          "ldap_user": "${var.LAMPNode01_httpd_os_users_web_content_owner_ldap_user}",
          "name": "${var.LAMPNode01_httpd_os_users_web_content_owner_name}",
          "shell": "/bin/bash"
        }
      },
      "php_mod_enabled": "${var.LAMPNode01_httpd_php_mod_enabled}",
      "server_admin": "webmaster@orpheus.ibm.com",
      "server_name": "orpheus.ibm.com",
      "version": "2.4",
      "vhosts_enabled": "${var.LAMPNode01_httpd_vhosts_enabled}"
    },
    "ibm": {
      "sw_repo": "${var.ibm_sw_repo}",
      "sw_repo_user": "${var.ibm_sw_repo_user}"
    },
    "ibm_internal": {
      "roles": "[httpd24-base-install]"
    }
  },
  "vault_content": {
    "item": "secrets",
    "values": {
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
##### Resource : LAMPNode01_oracle_mysql_base
#########################################################

resource "camc_softwaredeploy" "LAMPNode01_oracle_mysql_base" {
  depends_on      = ["camc_bootstrap.LAMPNode01_chef_bootstrap_comp"]
  name            = "LAMPNode01_oracle_mysql_base"
  camc_endpoint   = "${var.ibm_pm_service}/v1/software_deployment/chef"
  access_token    = "${var.ibm_pm_access_token}"
  skip_ssl_verify = true
  trace           = true

  data = <<EOT
{
  "os_admin_user": "${var.LAMPNode01-os_admin_user}",
  "stack_id": "${random_id.stack_id.hex}",
  "environment_name": "_default",
  "host_ip": "${vsphere_virtual_machine.LAMPNode01.network_interface.0.ipv4_address}",
  "node_name": "${var.LAMPNode01-name}",
  "runlist": "role[oracle_mysql_base]",
  "node_attributes": {
    "ibm": {
      "sw_repo": "${var.ibm_sw_repo}",
      "sw_repo_user": "${var.ibm_sw_repo_user}"
    },
    "ibm_internal": {
      "roles": "[oracle_mysql_base]"
    },
    "mysql": {
      "config": {
        "data_dir": "${var.LAMPNode01_mysql_config_data_dir}",
        "databases": {
          "database_1": {
            "database_name": "${var.LAMPNode01_mysql_config_databases_database_1_database_name}",
            "users": {
              "user_1": {
                "name": "${var.LAMPNode01_mysql_config_databases_database_1_users_user_1_name}"
              },
              "user_2": {
                "name": "${var.LAMPNode01_mysql_config_databases_database_1_users_user_2_name}"
              }
            }
          }
        },
        "log_file": "${var.LAMPNode01_mysql_config_log_file}",
        "port": "${var.LAMPNode01_mysql_config_port}"
      },
      "install_from_repo": "${var.LAMPNode01_mysql_install_from_repo}",
      "os_users": {
        "daemon": {
          "gid": "${var.LAMPNode01_mysql_os_users_daemon_gid}",
          "home": "${var.LAMPNode01_mysql_os_users_daemon_home}",
          "ldap_user": "${var.LAMPNode01_mysql_os_users_daemon_ldap_user}",
          "name": "${var.LAMPNode01_mysql_os_users_daemon_name}",
          "shell": "${var.LAMPNode01_mysql_os_users_daemon_shell}"
        }
      },
      "version": "${var.LAMPNode01_mysql_version}"
    }
  },
  "vault_content": {
    "item": "secrets",
    "values": {
      "ibm": {
        "sw_repo_password": "${var.ibm_sw_repo_password}"
      },
      "mysql": {
        "config": {
          "databases": {
            "database_1": {
              "users": {
                "user_1": {
                  "password": "${var.LAMPNode01_mysql_config_databases_database_1_users_user_1_password}"
                },
                "user_2": {
                  "password": "${var.LAMPNode01_mysql_config_databases_database_1_users_user_2_password}"
                }
              }
            }
          }
        },
        "root_password": "${var.LAMPNode01_mysql_root_password}"
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

output "LAMPNode01_ip" {
  value = "VM IP Address : ${vsphere_virtual_machine.LAMPNode01.network_interface.0.ipv4_address}"
}

output "LAMPNode01_name" {
  value = "${var.LAMPNode01-name}"
}

output "LAMPNode01_roles" {
  value = "httpd24-base-install,oracle_mysql_base"
}

output "stack_id" {
  value = "${random_id.stack_id.hex}"
}
