## General

#list disks
diskutil list 

#unmount 
umount /dev/<disk>

# eject disk unit 
diskutil eject /dev/<disk>

#partition Disk
diskutil partitionDisk /dev/disk2 1 "Free Space" "unused" "100%"



#http://osxdaily.com/2015/06/05/copy-iso-to-usb-drive-mac-os-x-command/

#create bootable disk from image
sudo dd if=/path/image.iso of=/dev/<disk> bs=1m

## Using Images
#https://blog.tinned-software.net/create-bootable-usb-stick-from-iso-in-mac-os-x/

hdiutil convert -format UDRW -o destination_file.img source_file.iso

