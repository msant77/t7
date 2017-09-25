
# 'gcloud compute instances'


## Basic Script set 

`gcloud compute instances COMMAND [GCLOUD_WIDE_FLAG ...]` - Read and manipulate Google Compute Engine virtual machine instances.

`gcloud compute instances list` - will list instances in the following format: 
```
NAME         ZONE                  MACHINE_TYPE               PREEMPTIBLE  INTERNAL_IP  EXTERNAL_IP    STATUS
vmname    southamerica-east1-a  custom (2 vCPU, 8.00 GiB)               10.0.0.3   192.168.0.10   RUNNING
vmname02  southamerica-east1-a  n1-standard-1                           10.0.0.4   192.168.0.11  TERMINATED
```

`gcloud compute instances describe` - will produce a through output about the supplied instance name, the following will highlight just the most useful stuff: 
```
canIpForward: false
cpuPlatform: Intel Broadwell
creationTimestamp: '2017-09-13T12:18:49.737-07:00'
description: Test windows machine on google cloudd
disks:
- autoDelete: true
  boot: true
  deviceName: dbdevgc01
  index: 0
  interface: SCSI
  kind: compute#attachedDisk
```

`gcloud compute instance start [INSTANCE_NAME]` and `gcloud compute instance stop [INSTANCE_NAME]` - will respectively start and stop the named resource

:neutral_face: `start` will produce this meaningless output
``` 
Updated [https://www.googleapis.com/compute/v1/projects/proj-name/zones/southamerica-east1-a/instances/
```

:neutral_face: so does `stop`
```
Updated [https://www.googleapis.com/compute/v1/projects/proj-name/zones/southamerica-east1-a/instances/
``` 
:smile_face: but they will produce the desired effect



## Complete command list to `gcloud compute instance` 

     add-access-config
        Create a Google Compute Engine virtual machine access configuration.

     add-labels
        Add labels to Google Compute Engine virtual machine instances.

     add-metadata
        Add or update instance metadata.

     add-tags
        Add tags to Google Compute Engine virtual machine instances.

     attach-disk
        Attach a disk to an instance.

     create
        Create Google Compute Engine virtual machine instances.

     delete
        Delete Google Compute Engine virtual machine instances.

     delete-access-config
        Delete an access configuration from a virtual machine network
        interface.

     describe
        Describe a virtual machine instance.

     detach-disk
        Detach disks from Compute Engine virtual machine instances.

     get-serial-port-output
        Read output from a virtual machine instance's serial port.

     list
        List Google Compute Engine instances.

     move
        Move an instance and its attached persistent disks between zones.

     remove-labels
        Remove labels from Google Compute Engine virtual machine instances.

     remove-metadata
        Remove instance metadata.

     remove-tags
        Remove tags from Google Compute Engine virtual machine instances.

     reset
        Reset a virtual machine instance.

     set-disk-auto-delete
        Set auto-delete behavior for disks.

     set-machine-type
        Set machine type for Google Compute Engine virtual machines.

     set-scheduling
        Set scheduling options for Google Compute Engine virtual machines.

     set-service-account
        Set service account and scopes for a Google Compute Engine instance.

     start
        Start a stopped virtual machine instance.

     stop
        Stop a virtual machine instance.

     tail-serial-port-output
        Periodically fetch new output from a virtual machine instance's serial
        port and display it as it becomes available.

     update
        Update a Google Compute Engine virtual machine.