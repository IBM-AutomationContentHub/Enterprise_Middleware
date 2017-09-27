# Template - IBM DB2 Template - multiple disks
Template Version - 1.0

## Description

This template deploys IBM DB2 Enterprise Server Edition 10.5 on a Linux virtual machine.<br>IBM DB2 is installed and configured with a single instance and database created.<br>The DB2 instance, database data, logs and archive stored in separate partitions.<br>

## Features

### Default Virtual Machine Settings

Flavor: VCPU = 2, Memory = 2GB<br>Attached Storage: Linux files systems = 10GB, 40GB, 10GB, 20GB)<br>
### Clouds

VMware<br>
### Software Deployed

IBM DB2 Enterprise Server Edition 10.5<br>
### Template Version

V1.0<br>
### Operating Systems Supported

Red Hat Enterprise Linux 7<br>Red Hat Enterprise Linux 6<br>Ubuntu 14.04 LTS<br>
### Topology

1 virtual machine:<br>  IBM DB2<br>    db2 instance 1, 1 database<br>
### Usage and special notes

1. The user is responsible for obtaining appropriate software licenses and downloads prior to template deployment.<br>2. Detailed system requirements for DB2 10.5 - https://www.ibm.com/software/reports/compatibility/clarity/index.html<br>3. IBM Knowledge Center for DB2 10.5 - https://www.ibm.com/support/knowledgecenter/en/SSEPGG_10.5.0<br>4. IBM Support Portal - https://www.ibm.com/support/home/<br>


## Overview

### License and Maintainer

Copyright IBM Corp. 2016, 2017 

### Target Cloud Type

VMware vSphere

### Software Deployed

- IBM DB2 Enterprise Server

### Major Versions

- IBM DB2 Enterprise Server 10.5
- IBM DB2 Enterprise Server 11.1


### Minor Versions

- IBM DB2 Enterprise Server 10.5.0.3
- IBM DB2 Enterprise Server 10.5.0.8
- IBM DB2 Enterprise Server 11.1.0.0


*Note, these represent base versions only, explicit fixpacks may also be added.*

### Platforms Supported

The following Operating Systems are supported for software defined in this template.

- RHEL 6.x
- RHEL 7.x
- Ubuntu 14.0.4


### Nodes Description

The following table describes the nodes and relevant software component deployed on each node.

<table>
  <tr>
    <th>Node Name</th>
    <th>Component</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>referenced-image</code></td>
    <td>db2_v105_install</code></td>
    <td>DB2 v10.5 role for default installation and configuration</code></td>
  </tr>
  <tr>
    <td>referenced-image</code></td>
    <td>db2_create_db</code></td>
    <td>Creates a new DB2 instance and database over an existing DB2 installation</code></td>
  </tr>
  <tr>
    <td>referenced-image</code></td>
    <td>linux_cloud_fs</code></td>
    <td></code></td>
  </tr>
</table>


### Autoscaling Support

Nil

## Software Resource Minimal Requirements

The following is a summary of the minimal requirements available to the base operating system to support a successful deployment.

### IBM DB2 Enterprise Server
<table>
  <tr>
    <td>Internal Firewall</td>
    <td>off</td>
  </tr>
  <tr>
    <td>Min Disk</td>
    <td>20GB</td>
  </tr>
  <tr>
    <td>Min CPU</td>
    <td>1</td>
  </tr>
  <tr>
    <td>Remote Root Access</td>
    <td>yes</td>
  </tr>
  <tr>
    <td>Min Memory</td>
    <td>1024</td>
  </tr>
</table>


## Disk Requirements

The following lists on a per-product basis the minimal reccomended disk required for each product installed.

### IBM DB2 Enterprise Server
<table>
  <tr>
    <td>/tmp/ibm_cloud</td>
    <td>1536</td>
  </tr>
  <tr>
    <td>/opt/ibm/db2</td>
    <td>500</td>
  </tr>
  <tr>
    <td>/var</td>
    <td>512</td>
  </tr>
  <tr>
    <td>/tmp</td>
    <td>2048</td>
  </tr>
</table>


## Software Repository Libraries

The following standard operating system libraries are required in the relevant Operating System library for each Operating System.

### IBM DB2 Enterprise Server
<table>
  <tr>
    <td>debian</td>
    <td>x86_64</td>
    <td>cpp, compat-libstdc++-33, gcc, gcc-c++, libaio, libstdc++, kernel-devel, ksh, nfs-utils, openssh, openssh-server, pam, redhat-lsb, sg3_utils</td>
  </tr>
  <tr>
    <td>redhat</td>
    <td>x86_64</td>
    <td>cpp, gcc, ksh, openssh-server, rpm, unzip, binutils, libaio1</td>
  </tr>
</table>


## Network Connectivity and Security Groups

Network connectivity is required from the deployed nodes to standard infrastructure. The following is a description of the network Ports required on each node based on the software deployed on that node.

### IBM DB2 Enterprise Server
<table>
  <tr>
    <td>DB2 Port</td>
    <td>50000</td>
  </tr>
  <tr>
    <td>FCM Port</td>
    <td>60000</td>
  </tr>
  <tr>
    <td>Min CPU</td>
    <td>1</td>
  </tr>
</table>


# Software Repository Requirements

The following files are neccessary on the Software Repository to successfully install this product. Please refer to the document on managing software repositories for the correct method to load  and manage files on the Software Repository.

## IBM DB2 Enterprise Server
### Installation
<table>
  <tr>
    <th>Version</th>
    <th>Arch</th>
    <th>Repository Root</th>
    <th>File</th>
  </tr>
  <tr>
    <td>11</td>
    <td>X86_64</td>
    <td>/db2/v11/base</td>
    <td><br>DB2_Svr_11.0.0.0_Linux_linuxx64.tar.gz</br></td>
  </tr>
  <tr>
    <td>10</td>
    <td>X86_64</td>
    <td>/db2/v10/base</td>
    <td><br>DB2_Svr_10.5.0.0_Linux_linuxx64.tar.gz</br></td>
  </tr>
</table>

### Fixpack
<table>
  <tr>
    <th>Fixpack Version</th>
    <th>Arch</th>
    <th>Repository Root</th>
    <th>File</th>
  </tr>
  <tr>
    <td>10.5.0.3</td>
    <td>X86_64</td>
    <td>/db2/v10/maint</td>
    <td><br>DB2_Svr_10.5.0.3_Linux_linuxx64.tar.gz</br></td>
  </tr>
  <tr>
    <td>11.1</td>
    <td>X86_64</td>
    <td>/db2/v11/base</td>
    <td><br>DB2_Svr_11.1.0.0_Linux_linuxx64.tar.gz</br></td>
  </tr>
</table>


# Cloud Specific Requirements

The following is required prior to deploying the template on the target cloud. These details will either be required by the deployer or injected by the platform at runtime.

<table>
  <tr>
    <th>softlayer_username</th>
    <th>The API Username used to connect to IBM Softlayer</th>
  </tr>
  <tr>
    <td>softlayer_api_key</code></td>
    <th>The Softlayer API Key associated with the API User</th>
  </tr>
  <tr>
    <td>softlayer_endpoint_url</code></td>
    <th>The URL Associated with the Softlayer connection</th>
  </tr>
</table>

These variables are typically defined when creating a Cloud Connection.


