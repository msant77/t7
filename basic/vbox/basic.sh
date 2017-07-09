#basic commands to manage vbox environment and guests from the terminal
#http://www.howopensource.com/2011/06/how-to-use-virtualbox-in-terminal-commandline/

#create alias to use vbx instead of vboxmanage
alias vbx=vboxmanage 

# basic command list
#show help
vboxmanage

# list vms 
vboxmanage list vms <vmname>

#show vm state 
vboxmanage showvminfo <vmname> 

#start a vm 
vboxmanage startvm <vmname>

#start a vm when there is no vbox gui started
vboxmanage startvm win12r --type headless

#get vm ip value 
vboxmanage guestproperty enumerate <vmname> | grep IP

#ssh to vm 
ssh vm-user@`VBoxManage guestproperty get "<vmname>" "/VirtualBox/GuestInfo/Net/0/V4/IP" | awk '{ print $2 }'`

#save and close vm 
vboxmanage controlvm <vmname> savestate


