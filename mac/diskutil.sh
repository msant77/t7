#http://www.theinstructional.com/guides/disk-management-from-the-command-line-part-1
#http://www.theinstructional.com/guides/disk-management-from-the-command-line-part-2

#list disks
diskutil list 

#info disk
diskutil info <diskname>

#check and repair disk 
diskutil verifyVolume /Volumes/<volume name> 

#repair disk
diskutil repairVolume /Volumes/<volume name>
