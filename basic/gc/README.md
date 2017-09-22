``` 
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
  --boot-disk-type "pd-standard" --boot-disk-device-name "db-prod"




WARNING: You have selected a disk size of under [200GB]. This may result in poor I/O performance. For more information, see: https://developers.google.com/compute/docs/disks#performance.
Created [https://www.googleapis.com/compute/v1/projects/clirea-prod/zones/southamerica-east1-a/instances/db-prod].
NAME     ZONE                  MACHINE_TYPE   PREEMPTIBLE  INTERNAL_IP  EXTERNAL_IP    STATUS
db-prod  southamerica-east1-a  n1-standard-8               10.158.0.2   35.198.37.158  RUNNING
``` 


Creating the minimum machine, use the command below: 
```
gcloud beta compute --project "clirea-prod" instances create "vmmin" --zone "southamerica-east1-a" --machine-type "f1-micro" --subnet "default" --maintenance-policy "MIGRATE" --service-account "461101376066-compute@developer.gserviceaccount.com" --scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring.write","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append" --min-cpu-platform "Automatic" --tags "http-server" --image "debian-9-stretch-v20170918" --image-project "debian-cloud" --boot-disk-size "10" --boot-disk-type "pd-ssd" --boot-disk-device-name "vmmin"

```
This will open your port 80

```
gcloud compute --project=clirea-prod firewall-rules create default-allow-http --network=default --allow=tcp:80 --source-ranges=0.0.0.0/0 --target-tags=http-server
``` 


you receive the following as space disk (10gb). 

```
Filesystem      Size  Used Avail Use% Mounted on
udev            286M     0  286M   0% /dev
tmpfs            60M  2.4M   57M   5% /run
/dev/sda1       9.8G  967M  8.3G  11% /
tmpfs           297M     0  297M   0% /dev/shm
tmpfs           5.0M     0  5.0M   0% /run/lock
tmpfs           297M     0  297M   0% /sys/fs/cgroup
``` 
after `apt update` 
`/dev/sda1       9.8G  967M  8.3G  11% /`

