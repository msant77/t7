#first install minimum version, mind: 
#  - the keyboad (us standard)
#  - the user admin (root) and its password
# 
#boot and start system, login name is root

#step 1 after installation
### 1GB: after installation df -h got back with 1gb used 


#setup network 
#physical machine
#https://dzone.com/articles/centos-minimal-installation
#
#virtualbox
#http://unix.stackexchange.com/questions/78295/centos-no-network-interface-after-installation-in-virtualbox
# 

#ACTIVATE NETWORK FOR CENT OS 7x
#ip : show / manipulate routing, devices, policy routing and tunnels
ip

#ip a : shows the interfaces
# http://unix.stackexchange.com/questions/78295/centos-no-network-interface-after-installation-in-virtualbox
ip a 

#restart vm 
shutdown -r now

#update machine 
yum update 

### 1.3GB : after yum update 300 MB were used up in the system

#### sliced here to 

#INSTALL GUI
# Options
#  http://www.cio.com/article/2885122/linux/the-8-best-desktop-environments-for-linux.html
#  KDE Plasma (furthest) http://www.cio.com/article/2885122/linux/the-8-best-desktop-environments-for-linux.html#slide9
#  LXDE (lightest) http://www.cio.com/article/2885122/linux/the-8-best-desktop-environments-for-linux.html#slide4
#  Mate (in-between) http://mate-desktop.com/

#KDE Plasma
#install 
yum groupinstall "KDE Plasma Workspaces" -y
#get default targeted gui
systemctl get-default

#change default targeted gui
systemctl set-default graphical.target

#immediately trigger the gui
systemctl isolate graphical.target

#remove KDE Plasma
yum groupremove "KDE Plasma Workspace"
### 4.2GB : with KDE Plasma


#xfce
rpm -Uvh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-2.noarch.rpm
yum update
yum groupinstall "X Window system"
yum groupinstall xfce
systemctl isolate graphical.target
systemctl set-default graphical.target
