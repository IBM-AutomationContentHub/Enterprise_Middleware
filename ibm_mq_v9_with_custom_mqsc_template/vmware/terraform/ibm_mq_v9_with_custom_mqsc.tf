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

# This is a terraform generated template generated from ibm_mq_v9_with_custom_mqsc

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

#Variable : wmq_qmgr_qmgr1_dlq
variable "wmq_qmgr_qmgr1_dlq" {
  type        = "string"
  description = "Queue Manager Dead Letter Queue"
  default     = "SYSTEM.DEAD.LETTER.QUEUE"
}

#Variable : wmq_qmgr_qmgr1_loggingtype
variable "wmq_qmgr_qmgr1_loggingtype" {
  type        = "string"
  description = "Type of logging to use ll(Linear), lc(Circular)"
  default     = "lc"
}

#Variable : wmq_qmgr_qmgr1_primarylogs
variable "wmq_qmgr_qmgr1_primarylogs" {
  type        = "string"
  description = "Number of Primary Logs to create."
  default     = "10"
}

#Variable : wmq_qmgr_qmgr1_secondarylogs
variable "wmq_qmgr_qmgr1_secondarylogs" {
  type        = "string"
  description = "Number of Secondary Logs"
  default     = "20"
}

##### MQV9Node01 variables #####
#Variable : MQV9Node01-image
variable "MQV9Node01-image" {
  type        = "string"
  description = "Operating system image id / template that should be used when creating the virtual image"
}

#Variable : MQV9Node01-name
variable "MQV9Node01-name" {
  type        = "string"
  description = "Short Hostname of virtual machine"
}

#Variable : MQV9Node01-os_admin_user
variable "MQV9Node01-os_admin_user" {
  type        = "string"
  description = "Name of admin user account in virtual machine to be SSHed into; Please refer to the documents from OS image vendors to obtain the default admin users"
}

#Variable : MQV9Node01_wmq_advanced
variable "MQV9Node01_wmq_advanced" {
  type        = "string"
  description = "Whether to install MQSeries Advanced Componenets - File Transfer, Telemetry, AMS"
  default     = "false"
}

#Variable : MQV9Node01_wmq_fixpack
variable "MQV9Node01_wmq_fixpack" {
  type        = "string"
  description = "The Fixpack of MQSeries to install."
  default     = "1"
}

#Variable : MQV9Node01_wmq_net_core_rmem_default
variable "MQV9Node01_wmq_net_core_rmem_default" {
  type        = "string"
  description = "WebSphere MQ Server Kernel Configuration net_core_rmem_default"
  default     = "10240"
}

#Variable : MQV9Node01_wmq_net_core_rmem_max
variable "MQV9Node01_wmq_net_core_rmem_max" {
  type        = "string"
  description = "WebSphere MQ Server Kernel Configuration net_core_rmem_max"
  default     = "4194304"
}

#Variable : MQV9Node01_wmq_net_core_wmem_default
variable "MQV9Node01_wmq_net_core_wmem_default" {
  type        = "string"
  description = "WebSphere MQ Server Kernel Configuration net_core_wmem_default"
  default     = "262144"
}

#Variable : MQV9Node01_wmq_net_ipv4_tcp_fin_timeout
variable "MQV9Node01_wmq_net_ipv4_tcp_fin_timeout" {
  type        = "string"
  description = "WebSphere MQ Server Kernel Configuration net_ipv4_tcp_fin_timeout"
  default     = "60"
}

#Variable : MQV9Node01_wmq_net_ipv4_tcp_keepalive_intvl
variable "MQV9Node01_wmq_net_ipv4_tcp_keepalive_intvl" {
  type        = "string"
  description = "WebSphere MQ Server Kernel Configuration net_ipv4_tcp_keepalive_intvl"
  default     = "75"
}

#Variable : MQV9Node01_wmq_net_ipv4_tcp_keepalive_time
variable "MQV9Node01_wmq_net_ipv4_tcp_keepalive_time" {
  type        = "string"
  description = "WebSphere MQ Server Kernel Configuration net_ipv4_tcp_keepalive_time"
  default     = "7200"
}

#Variable : MQV9Node01_wmq_net_ipv4_tcp_rmem
variable "MQV9Node01_wmq_net_ipv4_tcp_rmem" {
  type        = "string"
  description = "WebSphere MQ Server Kernel Configuration net_ipv4_tcp_rmem"
  default     = "4096    87380   4194304"
}

#Variable : MQV9Node01_wmq_net_ipv4_tcp_sack
variable "MQV9Node01_wmq_net_ipv4_tcp_sack" {
  type        = "string"
  description = "WebSphere MQ Server Kernel Configuration net_ipv4_tcp_sack"
  default     = "1"
}

#Variable : MQV9Node01_wmq_net_ipv4_tcp_timestamps
variable "MQV9Node01_wmq_net_ipv4_tcp_timestamps" {
  type        = "string"
  description = "WebSphere MQ Server Kernel Configuration net_ipv4_tcp_timestamps"
  default     = "1"
}

#Variable : MQV9Node01_wmq_net_ipv4_tcp_window_scaling
variable "MQV9Node01_wmq_net_ipv4_tcp_window_scaling" {
  type        = "string"
  description = "WebSphere MQ Server Kernel Configuration net_ipv4_tcp_window_scaling"
  default     = "1"
}

#Variable : MQV9Node01_wmq_net_ipv4_tcp_wmem
variable "MQV9Node01_wmq_net_ipv4_tcp_wmem" {
  type        = "string"
  description = "WebSphere MQ Server Kernel Configuration net_ipv4_tcp_wmem"
  default     = "4096    87380   4194304"
}

#Variable : MQV9Node01_wmq_perms
variable "MQV9Node01_wmq_perms" {
  type        = "string"
  description = "Default permissions for MQSeries files on Unix"
  default     = "755"
}

#Variable : MQV9Node01_wmq_qmgr_qmgr1_description
variable "MQV9Node01_wmq_qmgr_qmgr1_description" {
  type        = "string"
  description = "Description of the Queue Manager"
  default     = "Default Queue Manager"
}

#Variable : MQV9Node01_wmq_qmgr_qmgr1_listener_port
variable "MQV9Node01_wmq_qmgr_qmgr1_listener_port" {
  type        = "string"
  description = "Port the Queue Manager listens on."
  default     = "1414"
}

#Variable : MQV9Node01_wmq_qmgr_qmgr1_logsize
variable "MQV9Node01_wmq_qmgr_qmgr1_logsize" {
  type        = "string"
  description = "Size of the MQSeries Logs"
  default     = "16384"
}

#Variable : MQV9Node01_wmq_qmgr_qmgr1_name
variable "MQV9Node01_wmq_qmgr_qmgr1_name" {
  type        = "string"
  description = "Name of the Queue Manager to Create"
  default     = "QMGR1"
}

#Variable : MQV9Node01_wmq_service_name
variable "MQV9Node01_wmq_service_name" {
  type        = "string"
  description = "WebSphere MQ Service name"
  default     = "mq"
}

#Variable : MQV9Node01_wmq_swap_file
variable "MQV9Node01_wmq_swap_file" {
  type        = "string"
  description = "swap file name"
  default     = "/swapfile"
}

#Variable : MQV9Node01_wmq_swap_file_size
variable "MQV9Node01_wmq_swap_file_size" {
  type        = "string"
  description = "UNIX Swap size in megabytes"
  default     = "512"
}

#Variable : MQV9Node01_wmq_version
variable "MQV9Node01_wmq_version" {
  type        = "string"
  description = "The Version of MQSeries to install, eg, 8.0"
  default     = "9.0"
}

##### ungrouped variables #####
#Variable : wmq_mqsc_script_url
variable "wmq_mqsc_script_url" {
  type        = "string"
  description = "Generated"
  default     = "none"
}

#########################################################
##### Resource : MQV9Node01
#########################################################

variable "MQV9Node01-os_password" {
  type        = "string"
  description = "Operating System Password for the Operating System User to access virtual machine"
}

variable "MQV9Node01_folder" {
  description = "Target vSphere folder for virtual machine"
}

variable "MQV9Node01_datacenter" {
  description = "Target vSphere Datacenter for virtual machine creation"
}

variable "MQV9Node01_number_of_vcpu" {
  description = "Number of virtual CPU for the virtual machine, which is required to be a positive Integer"
  default     = "2"
}

variable "MQV9Node01_memory" {
  description = "Memory for virtual machine in MBs, which is required to be one or more times of 1024"
  default     = "2048"
}

variable "MQV9Node01_cluster" {
  description = "Target vSphere cluster to host the virtual machine"
}

variable "MQV9Node01_dns_suffixes" {
  type        = "list"
  description = "Name resolution suffixes for the virtual network adapter"
}

variable "MQV9Node01_dns_servers" {
  type        = "list"
  description = "DNS servers for the virtual network adapter"
}

variable "MQV9Node01_network_interface_label" {
  description = "vSphere port group or network label for virtual machine's vNIC"
}

variable "MQV9Node01_ipv4_gateway" {
  description = "IPv4 gateway for vNIC configuration"
}

variable "MQV9Node01_ipv4_address" {
  description = "IPv4 address for vNIC configuration"
}

variable "MQV9Node01_ipv4_prefix_length" {
  description = "IPv4 Prefix length for vNIC configuration, which is required to be numbers between 8 and 32"
}

variable "MQV9Node01_root_disk_datastore" {
  description = "Data store or storage cluster name for target virtual machine's disks"
}

variable "MQV9Node01_root_disk_type" {
  type        = "string"
  description = "Type of template disk volume"
  default     = "eager_zeroed"
}

variable "MQV9Node01_root_disk_controller_type" {
  type        = "string"
  description = "Type of template disk controller"
  default     = "scsi"
}

variable "MQV9Node01_root_disk_keep_on_remove" {
  type        = "string"
  description = "Delete template disk volume when the virtual machine is deleted"
  default     = "false"
}

# vsphere vm
resource "vsphere_virtual_machine" "MQV9Node01" {
  name         = "${var.MQV9Node01-name}"
  folder       = "${var.MQV9Node01_folder}"
  datacenter   = "${var.MQV9Node01_datacenter}"
  vcpu         = "${var.MQV9Node01_number_of_vcpu}"
  memory       = "${var.MQV9Node01_memory}"
  cluster      = "${var.MQV9Node01_cluster}"
  dns_suffixes = "${var.MQV9Node01_dns_suffixes}"
  dns_servers  = "${var.MQV9Node01_dns_servers}"

  network_interface {
    label              = "${var.MQV9Node01_network_interface_label}"
    ipv4_gateway       = "${var.MQV9Node01_ipv4_gateway}"
    ipv4_address       = "${var.MQV9Node01_ipv4_address}"
    ipv4_prefix_length = "${var.MQV9Node01_ipv4_prefix_length}"
  }

  disk {
    type            = "${var.MQV9Node01_root_disk_type}"
    template        = "${var.MQV9Node01-image}"
    datastore       = "${var.MQV9Node01_root_disk_datastore}"
    keep_on_remove  = "${var.MQV9Node01_root_disk_keep_on_remove}"
    controller_type = "${var.MQV9Node01_root_disk_controller_type}"
  }

  # Specify the connection
  connection {
    type     = "ssh"
    user     = "${var.MQV9Node01-os_admin_user}"
    password = "${var.MQV9Node01-os_password}"
  }

  provisioner "file" {
    destination = "MQV9Node01_add_ssh_key.sh"

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
      "sudo bash -c 'chmod +x MQV9Node01_add_ssh_key.sh'",
      "sudo bash -c './MQV9Node01_add_ssh_key.sh  \"${var.MQV9Node01-os_admin_user}\" \"${var.user_public_ssh_key}\" \"${var.ibm_pm_public_ssh_key}\">> MQV9Node01_add_ssh_key.log 2>&1'",
    ]
  }
}

#########################################################
##### Resource : MQV9Node01_byos-runmqsc
#########################################################

resource "null_resource" "MQV9Node01_byos-runmqsc" {
  depends_on = ["camc_softwaredeploy.MQV9Node01_wmq_create_qmgrs"]

  # Specify the ssh connection
  connection {
    user        = "${var.MQV9Node01-os_admin_user}"
    private_key = "${base64decode(var.ibm_pm_private_ssh_key)}"
    host        = "${vsphere_virtual_machine.MQV9Node01.network_interface.0.ipv4_address}"
  }

  provisioner "file" {
    destination = "MQV9Node01_byos-runmqsc.properties"

    content = <<EOF
export wmq_mqsc_script_url="${var.wmq_mqsc_script_url}"

EOF
  }

  provisioner "file" {
    destination = "MQV9Node01_byos-runmqsc.sh"

    content = <<EOF
null
EOF
  }

  # Execute the script remotely
  provisioner "remote-exec" {
    inline = [
      "sudo bash -c 'chmod +x MQV9Node01_byos-runmqsc.properties'",
      "sudo bash -c '. ./MQV9Node01_byos-runmqsc.properties'",
      "sudo bash -c 'chmod +x MQV9Node01_byos-runmqsc.sh'",
      "sudo bash -c './MQV9Node01_byos-runmqsc.sh  >> MQV9Node01_byos-runmqsc.log 2>&1'",
      "sudo bash -c 'rm MQV9Node01_byos-runmqsc.properties'",
    ]
  }
}

#########################################################
##### Resource : MQV9Node01_chef_bootstrap_comp
#########################################################

resource "camc_bootstrap" "MQV9Node01_chef_bootstrap_comp" {
  depends_on      = ["camc_vaultitem.VaultItem", "vsphere_virtual_machine.MQV9Node01"]
  name            = "MQV9Node01_chef_bootstrap_comp"
  camc_endpoint   = "${var.ibm_pm_service}/v1/bootstrap/chef"
  access_token    = "${var.ibm_pm_access_token}"
  skip_ssl_verify = true
  trace           = true

  data = <<EOT
{
  "os_admin_user": "${var.MQV9Node01-os_admin_user}",
  "stack_id": "${random_id.stack_id.hex}",
  "environment_name": "_default",
  "host_ip": "${vsphere_virtual_machine.MQV9Node01.network_interface.0.ipv4_address}",
  "node_name": "${var.MQV9Node01-name}",
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
##### Resource : MQV9Node01_wmq_create_qmgrs
#########################################################

resource "camc_softwaredeploy" "MQV9Node01_wmq_create_qmgrs" {
  depends_on      = ["camc_softwaredeploy.MQV9Node01_wmq_v9_install"]
  name            = "MQV9Node01_wmq_create_qmgrs"
  camc_endpoint   = "${var.ibm_pm_service}/v1/software_deployment/chef"
  access_token    = "${var.ibm_pm_access_token}"
  skip_ssl_verify = true
  trace           = true

  data = <<EOT
{
  "os_admin_user": "${var.MQV9Node01-os_admin_user}",
  "stack_id": "${random_id.stack_id.hex}",
  "environment_name": "_default",
  "host_ip": "${vsphere_virtual_machine.MQV9Node01.network_interface.0.ipv4_address}",
  "node_name": "${var.MQV9Node01-name}",
  "runlist": "role[wmq_create_qmgrs]",
  "node_attributes": {
    "ibm": {
      "sw_repo": "${var.ibm_sw_repo}",
      "sw_repo_user": "${var.ibm_sw_repo_user}"
    },
    "ibm_internal": {
      "roles": "[wmq_create_qmgrs]"
    },
    "wmq": {
      "qmgr": {
        "qmgr1": {
          "description": "${var.MQV9Node01_wmq_qmgr_qmgr1_description}",
          "dlq": "${var.wmq_qmgr_qmgr1_dlq}",
          "listener_port": "${var.MQV9Node01_wmq_qmgr_qmgr1_listener_port}",
          "loggingtype": "${var.wmq_qmgr_qmgr1_loggingtype}",
          "logsize": "${var.MQV9Node01_wmq_qmgr_qmgr1_logsize}",
          "name": "${var.MQV9Node01_wmq_qmgr_qmgr1_name}",
          "primarylogs": "${var.wmq_qmgr_qmgr1_primarylogs}",
          "secondarylogs": "${var.wmq_qmgr_qmgr1_secondarylogs}"
        }
      }
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
##### Resource : MQV9Node01_wmq_v9_install
#########################################################

resource "camc_softwaredeploy" "MQV9Node01_wmq_v9_install" {
  depends_on      = ["camc_bootstrap.MQV9Node01_chef_bootstrap_comp"]
  name            = "MQV9Node01_wmq_v9_install"
  camc_endpoint   = "${var.ibm_pm_service}/v1/software_deployment/chef"
  access_token    = "${var.ibm_pm_access_token}"
  skip_ssl_verify = true
  trace           = true

  data = <<EOT
{
  "os_admin_user": "${var.MQV9Node01-os_admin_user}",
  "stack_id": "${random_id.stack_id.hex}",
  "environment_name": "_default",
  "host_ip": "${vsphere_virtual_machine.MQV9Node01.network_interface.0.ipv4_address}",
  "node_name": "${var.MQV9Node01-name}",
  "runlist": "role[wmq_v9_install]",
  "node_attributes": {
    "ibm": {
      "sw_repo": "${var.ibm_sw_repo}",
      "sw_repo_auth": "true",
      "sw_repo_self_signed_cert": "true",
      "sw_repo_user": "${var.ibm_sw_repo_user}"
    },
    "ibm_internal": {
      "roles": "[wmq_v9_install]"
    },
    "wmq": {
      "advanced": "${var.MQV9Node01_wmq_advanced}",
      "fixpack": "${var.MQV9Node01_wmq_fixpack}",
      "net_core_rmem_default": "${var.MQV9Node01_wmq_net_core_rmem_default}",
      "net_core_rmem_max": "${var.MQV9Node01_wmq_net_core_rmem_max}",
      "net_core_wmem_default": "${var.MQV9Node01_wmq_net_core_wmem_default}",
      "net_ipv4_tcp_fin_timeout": "${var.MQV9Node01_wmq_net_ipv4_tcp_fin_timeout}",
      "net_ipv4_tcp_keepalive_intvl": "${var.MQV9Node01_wmq_net_ipv4_tcp_keepalive_intvl}",
      "net_ipv4_tcp_keepalive_time": "${var.MQV9Node01_wmq_net_ipv4_tcp_keepalive_time}",
      "net_ipv4_tcp_rmem": "${var.MQV9Node01_wmq_net_ipv4_tcp_rmem}",
      "net_ipv4_tcp_sack": "${var.MQV9Node01_wmq_net_ipv4_tcp_sack}",
      "net_ipv4_tcp_timestamps": "${var.MQV9Node01_wmq_net_ipv4_tcp_timestamps}",
      "net_ipv4_tcp_window_scaling": "${var.MQV9Node01_wmq_net_ipv4_tcp_window_scaling}",
      "net_ipv4_tcp_wmem": "${var.MQV9Node01_wmq_net_ipv4_tcp_wmem}",
      "perms": "${var.MQV9Node01_wmq_perms}",
      "service_name": "${var.MQV9Node01_wmq_service_name}",
      "swap_file": "${var.MQV9Node01_wmq_swap_file}",
      "swap_file_size": "${var.MQV9Node01_wmq_swap_file_size}",
      "version": "${var.MQV9Node01_wmq_version}"
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

output "MQV9Node01_ip" {
  value = "VM IP Address : ${vsphere_virtual_machine.MQV9Node01.network_interface.0.ipv4_address}"
}

output "MQV9Node01_name" {
  value = "${var.MQV9Node01-name}"
}

output "MQV9Node01_roles" {
  value = "wmq_create_qmgrs,wmq_v9_install"
}

output "stack_id" {
  value = "${random_id.stack_id.hex}"
}
