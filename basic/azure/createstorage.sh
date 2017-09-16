echo "please be sure to have executed before this script the command"
echo "azure login"
echo ""

echo "if everything is logged in and fine, just press ENTER, otherwise, abort this operation because it ain't going any further"
Read 


echo "creating storage account"

echo "provide storage account name"
read storageaccountname 

echo "please, provide the resource group name"
read resourcegroupname

echo "please, provide the subscription guid"
read subscriptionGuid

subdom="$storageaccountname".anydomain.com.
blobdefault="$storageaccountname".blob.core.windows.net



echo "it is necessary now to create on registro.br or similar the CNAME record zone entry expected with the name of $subdom. "
echo "Point it to $blobdefault"
echo "Press ENTER when this pre req has been supplied accordingly" 

azure storage account create -v --kind blobstorage --sku-name LRS --access-tier Hot --custom-domain "$storageaccountname".anydomain.com -l southcentralus -g $resourcegroupname -s $subscriptionGuid $storageaccountname




azure storage account connectionstring show -g $resourcegroupname $storageaccountname

echo "********"
echo "please, if everything went fine copy the parameter connectionstring above and paste it in here"
echo "********"

read connstring

echo "enter name of the first folder for this account storage"
read firstfoldername

azure storage container create -p Blob -c ${connstring} $firstfoldername 
