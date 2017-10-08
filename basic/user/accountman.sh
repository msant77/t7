#shows all groups
getent group

#change current password
passwd

#create user
useradd <username> 

#change user password
passwd <username> 

#user mod
usermod -a -G exampleGroup exampleUser

#add to sudo 
usermod -a -G sudo username 


#user removal 
userdel <username>


# chfn, chsh, crypt, groupadd, groupdel, groupmod, 
# login.defs, newusers, subgid, subuid, users, groups

