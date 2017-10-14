firewall-cmd --zone=public --add-port="$1"/tcp --permanent

firewall-cmd --reload

