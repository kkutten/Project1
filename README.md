## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.
  
![](https://github.com/kkutten/Project1/blob/main/Diagram/PROJECT%201%20NETWORK%20DIAGRAM.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the playbook file(s) may be used to install only certain pieces of it, such as Filebeat.

  - [Filebeat Playbook](https://github.com/kkutten/Project1/blob/main/Ansible/Filebeat_Install-Playbook.yml)
  - [Metricbeat Playbook](https://github.com/kkutten/Project1/blob/main/Ansible/Metricbeat_Install-Playbook.yml)
  - [ELK Playbook](https://github.com/kkutten/Project1/blob/main/Ansible/Elk-Playbook.yml)

			This document contains the following details:
 				- Description of the Topology
				- Access Policies
				- ELK Configuration
  				- Beats in Use
  				- Machines Being Monitored
				- How to Use the Ansible Build

### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly __effective___, in addition to restricting __Access___ to the network.
- _TODO: What aspect of security do load balancers protect? They prevent unwanted or unauthorized traffic from reaching the application.
- What is the advantage of a jump box?_They add a security layer to the web servers preventing them from being exposed to the public.


Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the __configuration files__ and system __files___.
- _TODO: What does Filebeat watch for?_They watch for Log files or log events
- _TODO: What does Metricbeat record?_They record Metrics from on going services on the server

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway  | 10.0.0.4   | Linux            |
| Web-1    | Webserver| 10.0.0.7   | Linux            |
| Web-2    | Webserver| 10.0.0.8   | Linux            |
| Web-3    | Webserver| 10.1.0.4   | Linux            |
| VM-ELK   | Webserver| 10.0.0.9   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the __Jump-box-Provisioner___ machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses: 168.61.185.199
- _TODO: Add whitelisted IP addresses_

Machines within the network can only be accessed by _Jumpbox____.
- _TODO: Which machine did you allow to access your ELK VM?  My personal computer
- What was its IP address?_168.61.185.199

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | Yes                 | 10.0.0.1 10.0.0.2    |
| Web-1    | No                  | 168.61.185.199       |
| Web-2    | No                  | 168.61.185.199       |
| Web-3	   | No		         | 168.61.185.199       |
| VM-ELK   | Yes(http)           | 168.61.185.199       |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- _TODO: What is the main advantage of automating configuration with Ansible?_It is flexible because it allows changes to be made within any of the VMs associated with it.

The playbook implements the following tasks:
- _TODO: In 3-5 bullets, explain the steps of the ELK installation play. E.g., install Docker; download image; etc._
1) Install Docker.io 2)Install python3-pip 3)Install Docker Python Module
4) Download and launch a Docker web container 5)Download and launch a docker web container.

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

**Note**: The following image link needs to be updated. Replace `docker_ps_output.png` with the name of your screenshot image file.  


![Docker ps]https://github.com/kkutten/Project1/issues/1#issue-1139509169

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- _TODO: List the IP addresses of the machines you are monitoring_
10.0.0.4 	10.0.0.7 	10.0.0.8 	10.1.0.4 	10.0.0.9 

We have installed the following Beats on these machines:
- _TODO: Specify which Beats you successfully installed_Filebeat and Metricbeat

These Beats allow us to collect the following information from each machine:
- _TODO: In 1-2 sentences, explain what kind of data each beat collects, and provide 1 example of what you expect to see. E.g., `Winlogbeat` collects Windows logs, which we use to track user logon events, etc._

Filebeat monitors log files and log events. Example: Inputs and harvesters. While Metricbeat looks out for any information in the file system which has been manipulated.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the __ansible configuration____ file to ___run playbooks__.
- Update the __ansible host___ file to include...
- Run the playbook, and navigate to __Jumpbox__ to check that the installation worked as expected.

_TODO: Answer the following questions to fill in the blanks:_
- _Which file is the playbook? The elk-playbook.yml Where do you copy it?_
- _Which file do you update to make Ansible run the playbook on a specific machine? elk-playbook.yml file
How do I specify which machine to install the ELK server on versus which to install Filebeat on?_By using the IPs of the respective servers.
- _Which URL do you navigate to in order to check that the ELK server is running? http://[ElkProject1VM-ip]:5601/app/kibana

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._
