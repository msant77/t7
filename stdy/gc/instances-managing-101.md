# Considerations on how to create an image and import it elsewhere in the gcloud 
# More considerations on machine-type manipulation 
>
> This will create a new snapshot 
> Be aware to have the disk name, which is the first paramenter  
>
```
gcloud compute disks snapshot <diskname> --snapshot-names <snapshot-name> --zone <zone-name>
``` 

>
> Reliable information on how to import images and snapshot from diferent projects within a Google Cloud Organization 
> can be found at this stackoverflow [link](https://stackoverflow.com/questions/29585381/google-compute-engine-use-snapshot-from-another-project)
>

## Create an instance base on an image from another project 

```
gcloud config set project "project-2"
gcloud compute instances create <name-of-new-instance> \
    --image <name-of-your-image-from-project-1> \
    --image-project "project-1"
``` 

## Create a disk from a snapshot from another project 

```
gcloud compute --project <project_name> disks create <instance_name> --size "200" --zone "us-west1-b" --source-snapshot <snapshot_name> --type "pd-ssd"  

```


## Create an instance from the previously created disk 

```
gcloud beta compute --project <project_name> instances create <instance_name> --zone "us-west1-b" --machine-type "f1-micro" --subnet "default" --maintenance-policy "MIGRATE" --service-account "compute@developer.gserviceaccount.com" --scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring.write","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append" --min-cpu-platform "Automatic" --disk "name=<disk_name>,device-name=<device_name>,mode=rw,boot=yes,auto-delete=yes"

``` 

## Upgrade Machine Type
>
> Custom receives the amount of cores times the amount of RAM in giga bytes times 1024
>
> *. [Changing the Machine Type of a Stopped Instance](https://cloud.google.com/compute/docs/instances/changing-machine-type-of-stopped-instance)
>
``` 
gclooud compute instances set-machine-type <instance_name> --machine-type custom-2-2048
``` 

## Downgrade Instance
``` 
gclooud compute instances set-machine-type <instance_name> --machine-type f1-micro

``` 
## List Machine Types 

>
> Grep by zone name could be a good idea in order to narrow down the list 
>
```
gcloud compute machine-types list
``` 

## Manipulate GPU
>
> so far, neither regular sdk or beta sdk support the manipulation of gpu on existing instances
>
> refer to the following link to know about updates to this condition and how to create an instance
> with GPU 
>
> *. [Adding GPU to Instances](https://cloud.google.com/compute/docs/gpus/add-gpus) 
>



