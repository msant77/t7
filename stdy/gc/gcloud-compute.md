
# `gcloud compute` 

## Basic Script set 

`gcloud compute` - List available commands, most of them are self-explanatory
```
ERROR: (gcloud.compute) too few arguments
Usage: gcloud compute [optional flags] <group | command>
  group may be           accelerator-types | addresses | backend-buckets |
                         backend-services | commitments | disk-types | disks |
                         firewall-rules | forwarding-rules | health-checks |
                         http-health-checks | https-health-checks | images |
                         instance-groups | instance-templates | instances |
                         machine-types | networks | operations | project-info |
                         regions | routers | routes | shared-vpc | snapshots |
                         ssl-certificates | target-http-proxies |
                         target-https-proxies | target-instances |
                         target-pools | target-ssl-proxies |
                         target-tcp-proxies | target-vpn-gateways | url-maps |
                         vpn-tunnels | xpn | zones
  command may be         config-ssh | connect-to-serial-port | copy-files |
                         reset-windows-password | scp | ssh

For detailed information on this command and its flags, run:
  gcloud compute --help
``` 

`gcloud compute --help` equivalent to `man <UNIX command>` 

## Children Commands Pages

- [gcloud compute instances](./gcloud-compute-instances.md)
- [gcloud compute firewall-rules](./gcloud-compute-firewall-rules.md)