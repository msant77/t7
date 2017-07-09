#sourced from http://osxdaily.com/2016/08/16/enable-ssh-mac-command-line/

#check if ssh remote login is enabled 
sudo systemsetup -getremotelogin 

#enable ssh 
sudo systemsetup -setremotelogin on 

#disable ssh 
sudo systemsetup -setremotelogin off

#enable ssh, no questions asked 
sudo systemsetup -f -setremotelogin on

#disable ssh, no questions asked 
sudo systemsetup -f -setremotelogin off

