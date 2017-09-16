#setting static variables
subscriptionname=<subscription_Name>
regionname=southcentralus
resourcegroup=<resource_group_name>

ostype=Windows #or Linux
imageurn=Win2012R2Datacenter #or CentOS

username=<user_name>
defaultpwd="<user_password>"

echo  "please, provide vm name"
read vmname

azure vm quick-create -v -s $subscriptionname  $resourcegroup $vmname $regionname $ostype $imageurn $username $defaultpwd 