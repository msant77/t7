#list all disks 
sudo fdisk -l 

#simple disks list 
lsblk

#throw some extra info
lsblk -l -o KNAME,NAME,SIZE,MODEL,MOUNTPOINT,ROTA,LABEL,UUID,SCHED

#initialize and partition disk 
fdisk /dev/sdb

#Command (m for help): m     (Enter the letter "m" to get list of commands)
#Command action
#   a   toggle a bootable flag
#   b   edit bsd disklabel
#   c   toggle the dos compatibility flag
#   d   delete a partition
#   l   list known partition types
#   m   print this menu
#   n   add a new partition
#   o   create a new empty DOS partition table
#   p   print the partition table
#   q   quit without saving changes
#   s   create a new empty Sun disklabel
#   t   change a partition's system id
#   u   change display/entry units
#   v   verify the partition table
#   w   write table to disk and exit
#   x   extra functionality (experts only)

#Command (m for help): n
#Command action
#   e   extended
#   p   primary partition (1-4)
# p
# Partition number (1-4): 1
# First cylinder (1-9729, default 1):
# Using default value 1
# Last cylinder, +cylinders or +size{K,M,G} (1-9729, default 9729):
# Using default value 9729

# Command (m for help): w    (Write and save partition table)

# format disk and give it the 'disk2' label 
mkfs.ext4 -L disk2 /dev/sdb1


#mount disk 
# needs creation of assigned path
mkdir /media/mount/path && mount -t ext4 /dev/sdb1 $_



