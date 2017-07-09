# run airmon-ng in monitor mode
airmon-ng start wlan0

# check chipset mode
iwconfig wlan0

#wlan0     IEEE 802.11abgn  ESSID:"GUSTAVO"  
#          Mode:Managed  Frequency:2.437 GHz  Access Point: C8:3A:35:36:93:E8   
#          Bit Rate=120 Mb/s   Tx-Power=22 dBm   
#          Retry short limit:7   RTS thr:off   Fragment thr:off
#          Encryption key:off
#          Power Management:on
#          Link Quality=34/70  Signal level=-76 dBm  
#          Rx invalid nwid:0  Rx invalid crypt:0  Rx invalid frag:0
#          Tx excessive retries:0  Invalid misc:57   Missed beacon:0

#wlan0     IEEE 802.11abgn  ESSID:"s\xE2\x98\x86rfd7onB"  
#          Mode:Managed  Frequency:2.412 GHz  Access Point: E4:58:E7:D7:18:6A   
#          Bit Rate=120 Mb/s   Tx-Power=22 dBm   
#          Retry short limit:7   RTS thr:off   Fragment thr:off
#          Encryption key:off
#          Power Management:on
#          Link Quality=70/70  Signal level=-37 dBm  
#          Rx invalid nwid:0  Rx invalid crypt:0  Rx invalid frag:0
#          Tx excessive retries:0  Invalid misc:24   Missed beacon:0


# COMMANDS TO MANAGE THE OVERALL ASPACTS OF LOCAL WIFI

# to see list of saved connections , use wlan0 
nmcli c

# to see list of available WiFi hotspots 
nmcli d wifi list

#or 
sudo iwlist wlan0 scanning

#to see list of interfaces
ifconfig -a


##disconnect 
nmcli d disconnect wlan0
#or
nmcli c down wlan0

#connect 
nmcli d connect wlan0
#or 
nmcli c up wlan0



#starts a deauthorise attack 



#turn off wireless card 
ifconfig wlan0 down

#change iwconfig mode to monitor
iwconfig wlan0 mode monitor

#turn on wireless card
ifconfig wlan0 up

#start airodump to discover SSIDs on interface
airodump-ng --ivs --write capture wlan0


