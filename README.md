## Automated ELK Stack Deployment
  
The files in this repository were used to configure the network as depicted in the below diagram:

![](https://github.com/kkutten/Project1/blob/main/Diagram/PROJECT%201%20NETWORK%20DIAGRAM.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the playbook file(s) may be used to install only certain pieces of it, such as Filebeat. The individual playbooks may be found in the below links.

  - [Filebeat Playbook](https://github.com/kkutten/Project1/blob/main/Ansible/Filebeat_Install-Playbook.yml)
  	- [Filebeat Config. File](https://github.com/kkutten/Project1/blob/main/Ansible/Filebeat_Configuration.yml)
  - [Metricbeat Playbook](https://github.com/kkutten/Project1/blob/main/Ansible/Metricbeat_Install-Playbook.yml)
  	- [Metricbeat Config. File](https://github.com/kkutten/Project1/blob/main/Ansible/Metricbeat_Config.yml)
  - [ELK Playbook](https://github.com/kkutten/Project1/blob/main/Ansible/Elk-Playbook.yml)

**This document contains the following details**:

- Description of the Topology
- Access Policies
- ELK Configuration
- Beats in Use
- Machines Being Monitored
- How to Use the Ansible Build

### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly **effective**, in addition to restricting **Access** to the network.

- Load Balancers prevent unwanted or unauthorized traffic from reaching the application as well as protecting against various attacks such as DDoS.
- Jump Boxes can add an additional layer of security to the web server by preventing them from being exposed to the general public and only exposed to those with the 		  provided SSH Key Pair. Jump Boxes function as a secure comomputer for admins to connect to as a starting point, before conducting adminitrative tasks.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the **configuration files** and system **files**.
- **What does Filebeat watch for?** Filebeat is used to watch for Log files or log events.
- **What does Metricbeat record?** Metricbeat is used to recored Metrics from on going services on the server.

The configuration details of each machine may be found below.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway  | 10.0.0.4   | Linux            |
| Web-1    | Webserver| 10.0.0.7   | Linux            |
| Web-2    | Webserver| 10.0.0.8   | Linux            |
| Web-3    | Webserver| 10.1.0.4   | Linux            |
| VM-ELK   | Webserver| 10.0.0.9   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the **Jump-box-Provisioner** machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses: 

- 168.61.185.199

Machines within the network can only be accessed by** Jumpbox**.
- **Which machine did you allow to access your ELK VM?**  
  - JumpBox/Ansible Container (10.0.0.4)

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses                |
|----------|---------------------|-------------------------------------|
| Jump Box | Yes                 | 10.0.0.1 10.0.0.2 168.61.185.199    |
| Web-1    | No                  | 10.0.0.4                            |
| Web-2    | No                  | 10.0.0.4                            |
| Web-3	   | No		               | 10.0.0.4                            |
| VM-ELK   | Yes(http)           | 168.61.185.199                      |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because Ansible is flexible because it allows changes to be made within any of the VMs associated with it and allows for configurations/deployments to be completed in an automated fashion which is more efficient.

**The playbook implements the following tasks:**

1. Install Docker.io 
2. Install python3-pip 
3. Install Docker Python Module
4. Increas Virtual Memory on host
5. Download and launch a Docker web container 

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![Docker ps](https://github.com/kkutten/Project1/blob/main/Ansible/Docker%20Container.PNG)

### Target Machines & Beats

This ELK server is configured to monitor the following machines:

- 10.0.0.7 	
- 10.0.0.8 	
- 10.1.0.4 	

We have installed the following Beats on these machines:

- Apache
- Docker
- System

These Beats allow us to collect the following information from each machine:

Filebeat monitors log files and log events, Ex:// Inputs and Harvesters. While Metricbeat looks out for any information in the file system which has been manipulated.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:

- Copy the **ansible configuration** file to /etc/ansible in order to run the playbook.
- Update the **ansible host** at /etc/ansible file to include...

```
[webservers]
#alpha.example.org
#beta.example.org
#192.168.1.100
#192.168.1.110
10.0.0.7 ansible_python_interpreter=/usr/bin/python3
10.0.0.8 ansible_python_interpreter=/usr/bin/python3

[elk]
10.0.0.9 ansible_python_interpreter=/usr/bin/python3

```
- Run the playbook, and navigate to **Jumpbox** to check that the installation worked as expected

**Answer the following questions to fill in the blanks:**

- **Which file is the playbook?** 
  - The elk-playbook.yml copied to **/etc/ansible**
- **Which file do you update to make Ansible run the playbook on a specific machine?** 
  - elk-playbook.yml file
- **How do I specify which machine to install the ELK server on versus which to install Filebeat on?**
  - By specifiying the IP address of the servers and assigning them a host group in the Host file, then calling on the Host in the the Ansible Playbook.
- **Which URL do you navigate to in order to check that the ELK server is running?** 
  - http://[**PUBLIC IP of ELK VM**]:5601/app/kibana
