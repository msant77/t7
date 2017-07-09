#https://www.digitalocean.com/community/tutorials/how-to-add-swap-space-on-ubuntu-16-04

#see if the system has any configured swap
sudo swapon --show

#verify that there is no active swap 
free -h

#allocate a file with an amount of data 
sudo fallocate -l 8G /swapfile

#Make the file only accessible to root
sudo chmod 600 /swapfile

#mark the file as swap space
sudo mkswap /swapfile

#back up the /etc/fstab file
sudo cp /etc/fstab /etc/fstab.bak

#add the swap file information to the end of your /etc/fstab file
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

#see the current swappiness value
cat /proc/sys/vm/swappiness

#set the swappiness to a different value 
sudo sysctl vm.swappiness=10

#set this value automatically at restart by adding the line to /etc/sysctl.conf
sudo nano /etc/sysctl.conf

#set the end of the file to 
vm.swappiness=<value>

#Adjusting the Cache Pressure Setting
cat /proc/sys/vvm/vfs_cache_pressure


