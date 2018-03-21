 # simple external network iptables entry
 iptables -L 
 # shows netstat full report filtered by localhost activities
 netstat -tulpn | grep "127.0.0.1" 
 #now filtered by local network
 netstat -tulpn | grep "192.168." 
 #brute full lsof report
 lsof
 # lsof filtered by LISTEN  
 lsof | grep LISTEN

#lsof filter by port number 
sudo lsof -i tcp:4000

#lsof with processes names
sudo lsof -nP | grep LISTEN

 


#net status, net usage
#install vnstat 
sudo apt-get install vnstat

#monitor 
watch -n 5 --differences vnstat -d eth0   

# last 10 history entries
 history | tail 
 # last 20 history entries  
 history | tail -n20

