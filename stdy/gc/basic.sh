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


# after that, it is needed that one adds the tools path to $PATH
# this line updates PATH 
source [path_to_google-cloud-sdk]/path.bash.inc 

# this one adds auto-completion 
source [path_to_google-cloud-sdk]/completion.bash.inc


#Install components for working with 


## Initialize the SDK

gcloud init 


# OUTSIDE TASK: log in the google cloud platform





#access virtual linux
# https://cloud.google.com/compute/docs/instances/connecting-to-instance

#enters the vm 
gcloud compute ssh [INSTANCE_NAME]

#better update first thing (aprox. 300mb download size)
yum update 

# create machine 8 cores x 30 gb ram
gcloud compute --project "project-name" instances create "vm-name" --zone "southamerica-east1-a" 
  --machine-type "n1-standard-8" --subnet "default" --maintenance-policy "MIGRATE" 
  --service-account "461101376066-compute@developer.gserviceaccount.com" 
  --scopes  "https://www.googleapis.com/auth/devstorage.read_only",
            "https://www.googleapis.com/auth/logging.write",
            "https://www.googleapis.com/auth/monitoring.write",
            "https://www.googleapis.com/auth/servicecontrol",
            "https://www.googleapis.com/auth/service.management.readonly",
            "https://www.googleapis.com/auth/trace.append" 
  --image "rhel-6-v20170918" --image-project "rhel-cloud" --boot-disk-size "30" 
  --boot-disk-type "pd-sdd" --boot-disk-device-name "db-prod"




WARNING: You have selected a disk size of under [200GB]. This may result in poor I/O performance. For more information, see: https://developers.google.com/compute/docs/disks#performance.
Created [https://www.googleapis.com/compute/v1/projects/project-name/zones/southamerica-east1-a/instances/vm-name].
NAME     ZONE                  MACHINE_TYPE   PREEMPTIBLE  INTERNAL_IP  EXTERNAL_IP    STATUS
vm-name  southamerica-east1-a  n1-standard-8               10.0.0.1     192.168.0.1    RUNNING





# Disk creation 
gcloud compute --project=projName disks create dsk-db-prod-backup --zone=southamerica-east1-a --type=pd-ssd --size=1000GB
gcloud compute --project=projName disks create dsk-db-prod-redo01 --zone=southamerica-east1-a --type=pd-ssd --size=10GB

# Disk Attachment 
# https://cloud.google.com/sdk/gcloud/reference/compute/instances/attach-disk
gcloud compute instances attach-disk db-prod \
      --disk dsk-db-prod-oracle --zone southamerica-east1-a



#show disk list 
gcloud compute disks list 



#cretes the minimun linux configuration 
# $8.58

gcloud beta compute --project "projName" instances create "vmmin" --zone "southamerica-east1-a" --machine-type "f1-micro" --subnet "default" --maintenance-policy "MIGRATE" --service-account "461101376066-compute@developer.gserviceaccount.com" --scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring.write","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append" --min-cpu-platform "Automatic" --tags "http-server" --image "debian-9-stretch-v20170918" --image-project "debian-cloud" --boot-disk-size "10" --boot-disk-type "pd-ssd" --boot-disk-device-name "vmmin"

# opens port 80
gcloud compute --project=projName firewall-rules create default-allow-http --network=default --allow=tcp:80 --source-ranges=0.0.0.0/0 --target-tags=http-server


#try to open 21 
gcloud beta compute --project=projname firewall-rules create open-ftp-21-vmmin --direction=INGRESS --priority=1000 --network=default --allow=21 --source-ranges=0.0.0.0/0 --source-tags=vmmin --target-tags=vmmin



POST https://www.googleapis.com/compute/v1/projects/projName/zones/southamerica-east1-a/instances
{
  "name": "vmmin",
  "zone": "projects/projName/zones/southamerica-east1-a",
  "minCpuPlatform": "Automatic",
  "machineType": "projects/projName/zones/southamerica-east1-a/machineTypes/f1-micro",
  "metadata": {
    "items": []
  },
  "tags": {
    "items": [
      "http-server"
    ]
  },
  "disks": [
    {
      "type": "PERSISTENT",
      "boot": true,
      "mode": "READ_WRITE",
      "autoDelete": true,
      "deviceName": "vmmin",
      "initializeParams": {
        "sourceImage": "projects/debian-cloud/global/images/debian-9-stretch-v20170918",
        "diskType": "projects/projName/zones/southamerica-east1-a/diskTypes/pd-ssd",
        "diskSizeGb": "10"
      }
    }
  ],
  "canIpForward": false,
  "networkInterfaces": [
    {
      "network": "projects/projName/global/networks/default",
      "subnetwork": "projects/projName/regions/southamerica-east1/subnetworks/default",
      "accessConfigs": [
        {
          "name": "External NAT",
          "type": "ONE_TO_ONE_NAT"
        }
      ],
      "aliasIpRanges": []
    }
  ],
  "description": "",
  "labels": {},
  "scheduling": {
    "preemptible": false,
    "onHostMaintenance": "MIGRATE",
    "automaticRestart": true
  },
  "serviceAccounts": [
    {
      "email": "461101376066-compute@developer.gserviceaccount.com",
      "scopes": [
        "https://www.googleapis.com/auth/devstorage.read_only",
        "https://www.googleapis.com/auth/logging.write",
        "https://www.googleapis.com/auth/monitoring.write",
        "https://www.googleapis.com/auth/servicecontrol",
        "https://www.googleapis.com/auth/service.management.readonly",
        "https://www.googleapis.com/auth/trace.append"
      ]
    }
  ]
}

POST https://www.googleapis.com/compute/v1/projects/projName/global/firewalls
{
  "name": "default-allow-http",
  "kind": "compute#firewall",
  "sourceRanges": [
    "0.0.0.0/0"
  ],
  "targetTags": [
    "http-server"
  ],
  "allowed": [
    {
      "IPProtocol": "tcp",
      "ports": [
        "80"
      ]
    }
  ],
  "network": "projects/projName/global/networks/default"
}
