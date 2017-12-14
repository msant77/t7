export AZURE_STORAGE_ACCESS_KEY=<enter storage account, properties/my access keys, copy one, paste here>
export AZURE_STORAGE_ACCOUNT=<first storage thing in the resource group>
az storage blob download-batch  --source <container-name> --destination ./
