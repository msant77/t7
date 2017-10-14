
curl https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-171.0.0-darwin-x86_64.tar.gz > gcsdk.tar.gz


#extract file
tar -xvzf gcsdk.tar.gz

cd google-cloud-sdk

#inside the folder used as a target to the extracted files
./install.sh

