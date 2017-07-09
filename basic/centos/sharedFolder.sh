#https://gist.github.com/larsar/1687725
# The VirtualBox documentation[1] for how to install guest additions 
# for Linux on a virtual host is somewhat messy. So here is what 
# I did to make it work.

# Install the packages required
yum update
yum install gcc kernel-devel make

#shutdown -r now

# Click: Devices/Install Guest Additions... 

# Mount the ISO image with the guest additions
mkdir /cdrom
mount /dev/cdrom /cdrom

# Install guest additions
/cdrom/VBoxLinuxAdditions.run

# Share a folder from the VirtualBox control panel, giving it a share name.

ls  /media/sf_<share_name>


# You could always mount the directory yourself as well
mkdir /a_folder_name 
mount -t vboxsf the_share_name /a_folder_name

#add user to the group vboxsf so that it can access 
usermod -a -G vboxsf e4e5

