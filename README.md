

# XCAT Management Node Setup Using Ansible

## Overview
This project automates the setup and configuration of an xCAT Management Node on an Ubuntu VM using Ansible.  
It includes playbooks and roles for installing xCAT

📂 Project Structure

```
ansible/
├── inventory.ini
├── install-xcat.yml
└── roles/
    ├── prepare_environment/
    │   ├── tasks/main.yml
    │   └── vars/main.yml
    ├── install_xcat_core/
    │   ├── tasks/main.yml
    │   └── vars/main.yml
    ├── install_xcat_dep/
    │   ├── tasks/main.yml
    │   └── vars/main.yml
    ├── configure_repos/
    │   ├── tasks/main.yml
    │   └── vars/main.yml
    └── finalize_install/
        ├── tasks/main.yml
        └── vars/main.yml
```
🛠 Roles Overview

1️⃣ prepare_environment
Purpose:
Prepares the working directory where all xCAT files (core and dependencies) will be downloaded and extracted.
Main actions:

Creates /home/{{ ansible_user }}/xcat directory to store all installation files.

2️⃣ install_xcat_core
Purpose:
Downloads, extracts, and sets up the xCAT core package repository locally on the management node.
Main actions:

Downloads the xcat-core .tar.bz2 archive.

Extracts it into the working directory.

Makes the mklocalrepo.sh script executable.

Runs mklocalrepo.sh to prepare the local core repository.

3️⃣ install_xcat_dep
Purpose:
Downloads, extracts, and sets up the xCAT dependencies repository.
Main actions:

Downloads the xcat-dep .tar.bz2 archive.

Extracts it into the working directory.

Makes the mklocalrepo.sh script executable.

Runs mklocalrepo.sh to prepare the local dependency repository.

4️⃣ configure_repos
Purpose:
Configures the apt repositories and keys so the system can install xCAT packages from the local repo.
Main actions:

Downloads and installs the xCAT apt key.

Updates the xcat-core repository list to mark it as trusted.

Installs software-properties-common to manage repositories.

Adds Ubuntu’s main and universe repositories.

5️⃣ finalize_install
Purpose:
Final clean-up and actual installation of xCAT.
Main actions:

Cleans apt cache.

Updates apt package lists.

Installs the xcat package from the configured repositories.

▶ Running the Playbook
1-Go to the project directory
```
cd ansible-task
```
2-Run the playbook
```
ansible-playbook -i inventory.ini install-xcat.yml
```
![Running playbook1](/images/Screenshot%202025-08-10%20142100.png)

![alt text](/images/Screenshot%202025-08-11%20230924.png/)

![alt text](/images/Screenshot%202025-08-11%20231012.png)

3-Checking the xcat version
```
lsxcatd -a
```
![alt text](/images/Screenshot%202025-08-11%20232100.png)

