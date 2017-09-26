
# 'gcloud compute firewall-rules' 
[Official Page](https://cloud.google.com/sdk/gcloud/reference/compute/firewall-rules/)


## Basic Script set 

`gcloud compute firewall-rules list` will list all rules in your project giving the following output
```
To show all fields of the firewall, please show in JSON format: --format=json
To show all fields in table format, please see the examples in --help.

NAME                    NETWORK  DIRECTION  PRIORITY  ALLOW                         DENY
default-allow-http      default  INGRESS    1000      tcp:80
default-allow-icmp      default  INGRESS    65534     icmp
default-allow-internal  default  INGRESS    65534     tcp:0-65535,udp:0-65535,icmp
default-allow-rdp       default  INGRESS    65534     tcp:3389
default-allow-ssh       default  INGRESS    65534     tcp:22
```

`gcloud compute firewall-rules describe default-allow-http` will output
```
allowed:
- IPProtocol: tcp
  ports:
  - '80'
creationTimestamp: '2017-09-13T11:32:06.220-07:00'
description: ''
direction: INGRESS
id: '1042537656757067786569'
kind: compute#firewall
name: default-allow-http
network: https://www.googleapis.com/compute/v1/projects/proj-name/global/networks/default
priority: 1000
selfLink: https://www.googleapis.com/compute/v1/projects/proj-name/global/firewalls/default-allow-http
sourceRanges:
- 0.0.0.0/0
targetTags:
- http-server 
```

`gcloud compute firewall-rules create sqlopen1433 --allow tcp:1433 --source-tags=dbdevgc01 --direction=IN` - will open port number 1433 to all incoming connections to the resource named `dbdevgc01`. Output is: 
```
Creating firewall...|Created [https://www.googleapis.com/compute/v1/projects/proj-name/global/firewalls/sqlopen1433].                                                        
Creating firewall...done.                                                                                                                                                              
NAME         NETWORK  DIRECTION  PRIORITY  ALLOW     DENY
sqlopen1433  default  INGRESS    1000      tcp:1433
```
Result can also be verified [here](https://console.cloud.google.com/networking/firewalls/details/sqlopen1433?project=proj-name&organizationId=876876876878) 




