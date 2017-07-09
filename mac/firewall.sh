#set up firewall 
#https://discussions.apple.com/message/30908439#30908439

#enable firewall logging
#check logging is on (should be) 
/usr/libexec/ApplicationFirewall/socketfilterfw --getloggingmode

#check logging option:
/usr/libexec/ApplicationFirewall/socketfilterfw --getloggingopt

#mine said 'throttled', so:
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setloggingopt detail

#check logging config for subsystem:
sudo log config --status --subsystem com.apple.alf

#likely says "Mode for 'com.apple.alf' INFO PERSIST_DEFAULT" so:
sudo log config --mode "persist:info" --subsystem com.apple.alf

#now use log(1) like
log show --predicate 'subsystem == "com.apple.alf"' --info --last 1h

