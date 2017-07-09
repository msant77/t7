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
 # last 10 history entries
 history | tail 
 # last 20 history entries  
 history | tail -n20

