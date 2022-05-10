cd /usr/local/src
git clone https://github.com/dylanaraps/neofetch
cd neofetch
make install

cd /usr/local/src
wget https://releases.hashicorp.com/terraform/0.12.15/terraform_0.12.15_linux_amd64.zip
unzip terraform_0.12.15_linux_amd64.zip
mv terraform /usr/bin

apt-add-repository ppa:ansible/ansible
apt-get update
apt-get install ansible -y

apt-get install dclock

# kvm hypervisor
sudo apt-get install qemu-kvm libvirt-dev libvirt-daemon libvirt-daemon-system libvirt-clients virtinst bridge-utils cpu-checker
kvm-ok


# 7z compression
sudo apt-get install p7zip-full

# conky and related resources
sudo add-apt-repository ppa:mark-pcnetspec/conky-manager-pm9
sudo apt-get install conky-all lm-sensors hddtemp
sudo apt-get install cmake libimlib2-dev libncurses5-dev libx11-dev libxdamage-dev libxft-dev libxinerama-dev libxml2-dev libxext-dev libcurl4-openssl-dev liblua5.3-dev
