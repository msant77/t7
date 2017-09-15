#Documentation and QuickStart for Mac OS X
#https://cloud.google.com/sdk/docs/quickstart-mac-os-x


#python version
#despite of what the documentation says, the v parameter is not supposed to be lower case

python -V

#reinstall python in case you don't feel that you are holding the latest version 
brew uninstall python && brew install python 


#following link will bring the sdk down to your machine
#refer to above link in order to get the latest sdk version 

curl https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-171.0.0-darwin-x86_64.tar.gz > gcsdk.tar.gz 


#extract file 
tar -xvzf gcsdk.tar.gz 


#inside the folder used as a target to the extracted files
./install.sh

## Initialize the SDK

gcloud init 


#log in the google cloud platform

