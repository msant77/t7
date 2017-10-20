# oracle recommendation linux red hat 6 machine drill

## disks 

- [ ] add all required disks for a 1tb data maximum capability
  - [x] create disks at the cloud provider
  - [x] attach disks to the machine
  - [x] partition all disks
  - [x] format all disks 
  - [x] mount all disks
  - [o] fstab all disks 

```
lsblk -l -o KNAME,NAME,SIZE,MODEL,MOUNTPOINT,ROTA,LABEL,UUID,SCHED,STATE


fdisk /dev/sdb
mkfs.ext4 -L oracle /dev/sdb1
fdisk /dev/sdc
mkfs.ext4 -L oracle-data /dev/sdc1
fdisk /dev/sdd
mkfs.ext4 -L oracle-backup /dev/sdd1
fdisk /dev/sde
mkfs.ext4 -L redo01 /dev/sde1
fdisk /dev/sdf
mkfs.ext4 -L redo02 /dev/sdf1
fdisk /dev/sdg
mkfs.ext4 -L tmp /dev/sdg1
fdisk /dev/sdh
mkfs.ext4 -L arch /dev/sdh1

mount -t ext4 /devsdb1 oracle
mount -t ext4 /dev/sdb1 oracle
mount -t ext4 /dev/sdc1 u01
mount -t ext4 /dev/sdd1 backup
mount -t ext4 /dev/sde1 redo01
mount -t ext4 /dev/sdf1 redo02
mount -t ext4 /dev/sdg1 tmp
mount -t ext4 /dev/sdh1 arch


```

```
/dev/sdb1       /oracle    ext4    defaults,nofail   1   2
/dev/sdc1       /u01    ext4    defaults,nofail   1   2
/dev/sdd1       /backup    ext4    defaults,nofail   1   2
/dev/sde1       /redo01    ext4    defaults,nofail   1   2
/dev/sdf1       /redo02    ext4    defaults,nofail   1   2
/dev/sdg1	      /tmp	   ext4	defaults,nofail   1   2
/dev/sdh1       /arch    ext4    defaults,nofail   1   2
```

## packages

- [x] install all required packages 

```

yum install binutils-2.20.51.0.2-5.11.el6 -y 
yum install compat-libstdc++-33-3.2.3-69.el6 -y 
yum install glibc-2.12-1.7.el6 -y 
yum install libaio-0.3.107-10.el6 -y
yum install libgcc-4.4.4-13.el6 -y 
yum install libstdc++-4.4.4-13.el6 -y
yum install make-3.81-19.el6 -y
yum install compat-libcap1-1.10-1 -y 
yum install gcc-4.4.4-13.el6 -y
yum install gcc-c++-4.4.4-13.el6 -y --skip-broken
yum install glibc-devel-2.12-1.7.el6 -y 
yum install libaio-devel-0.3.107-10.el6 -y
yum install libstdc++-devel-4.4.4-13.el6 -y --skip-broken
yum install sysstat-9.0.4-11.el6 -y
yum install compat-libstdc++-33-3.2.3-69.el6 -y
yum install glibc-2.12-1.7.el6 -y
yum install glibc-devel-2.12-1.7.el6 -y
yum install libaio-0.3.107-10.el6 -y 
yum install libaio-devel-0.3.107-10.el6 -y
yum install libgcc-4.4.4-13.el6 -y
yum install libstdc++-4.4.4-13.el6 -y
yum install libstdc++-devel-4.4.4-13.el6 -y
yum install cpp-4.4.4-13.el6 -y
yum install glibc-headers-2.12-1.7.el6 -y
yum install mpfr.x86_64 -y
``` 

## make pos install setup
- [x] set timezone 
- [ ] swap 
  - [ ] fstab swap 
  `/dev/sdx	/swap 	ext4 	defaults,nofail   1   2`

## create user and key to generate 
- [ ] sshkeygen
- [ ] upload public key 
- [ ] test connection





## stop oracle 

With the user oracle


`sqlplus / as sysdba` 

Then inside **SQL>** execue the following and wait

``` 
shutdown immediate
```

Response should be 

```
SQL> shutdown immediate
Database closed.
Database dismounted.
ORACLE instance shut down.
```  

Subir listener

`lsnrctl start`

In order to start the database execute the following
```
sqlplus / as sysdba
``` 

Then under **SQL>** 

```
Startup;
```
