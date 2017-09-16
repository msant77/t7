#setting static variables
subscriptionname=<subscription_Name>
regionname=southcentralus
resourcegroup=<resource_group_name>

ostype=Linux #or Windows
imageurn=CentOS #or Win2012R2Datacenter

username=<user_name>
defaultpwd="<user_password>"

echo  "please, provide the vm name"
read vmname

azure vm quick-create -v -s $subscriptionname  $resourcegroup $vmname $regionname $ostype $imageurn $username $defaultpwd 