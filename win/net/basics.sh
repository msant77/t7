#stops windows firewall 
netsh advfirewall set allprofiles state off

$starts windows firewall
netsh advfirewall set all profiles state on

#list established PID's connections
netstat -ano | grep ESTABLISHED


