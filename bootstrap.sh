#!/bin/bash

echo "[+] Creating xCAT working directory..."
mkdir -p ~/xcat
cd ~/xcat

echo "[+] Downloading xcat-core..."
wget https://xcat.org/files/xcat/xcat-core/2.17.x_Ubuntu/xcat-core/xcat-core-2.17.0-ubuntu.tar.bz2
tar jxvf xcat-core-2.17.0-ubuntu.tar.bz2
cd ~/xcat/xcat-core
sudo ./mklocalrepo.sh

echo "[+] Preparing for xcat-dep..."
cd ~/xcat
wget https://xcat.org/files/xcat/xcat-dep/2.x_Ubuntu/xcat-dep-2.17.0-ubuntu.tar.bz2
tar jxvf xcat-dep-2.17.0-ubuntu.tar.bz2
cd ~/xcat/xcat-dep
sudo ./mklocalrepo.sh

echo "[+] Adding xCAT apt key..."
wget http://xcat.org/files/xcat/repos/apt/apt.key -O xcat.key
sudo apt-key add xcat.key

echo "[+] Updating xcat-core.list to add trusted=yes..."
sudo sed -i 's|deb \[|deb [trusted=yes |' /etc/apt/sources.list.d/xcat-core.list

echo "[+] Installing required packages..."
sudo apt-get install -y software-properties-common

echo "[+] Adding Ubuntu repositories..."
sudo add-apt-repository -y "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main"
sudo add-apt-repository -y "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc)-updates main"
sudo add-apt-repository -y "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) universe"
sudo add-apt-repository -y "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc)-updates universe"

echo "[+] Cleaning and updating package lists..."
sudo apt-get clean all
sudo apt-get update

echo "[+] Installing xCAT..."
sudo apt-get install -y xcat

# echo "[+] Switching to root to continue..."
# sudo -i

# The rest of the steps continue in post_root.sh
