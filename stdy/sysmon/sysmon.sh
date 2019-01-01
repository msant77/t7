#check rapid7.com
#download metasploitable (weak linux machine)



#check all running processes
ps -A

#check and filter running processes by name 
ps -A | grep <name to find>

# list processes using a port
# lsof -ti tcp:<port number>

lsof -ti tcp:10010 

# list processes based on name 
ps -e | grep storeaccountd

# give all information about a process 
# launchctl print pid/<port number>

launchctl print pid/10010
