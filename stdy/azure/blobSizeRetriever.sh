az account set --subscription=<subscription id>
export AZURE_STORAGE_ACCESS_KEY=<storage account access key>
export AZURE_STORAGE_ACCOUNT=<storage account name>
az storage blob list --container-name clirea  --query "[*].[properties.contentLength]" --output tsv >> blob.bytes
paste  -d+ -s blob.bytes | bc
