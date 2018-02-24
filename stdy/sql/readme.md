# Sql Server on Docker

Tutorial at [https://docs.microsoft.com/en-us/sql/linux/quickstart-install-connect-docker](https://docs.microsoft.com/en-us/sql/linux/quickstart-install-connect-docker)


1. Pull the Sql Server 2017 Linux 
```
sudo docker pull microsoft/mssql-server-linux:2017-latest
```

2. Run the Container
```
sudo docker run -e 'ACCEPT_EULA=Y' -e 'MSSQL_SA_PASSWORD=strong5password1avoid2special3characters4' \
   -p 1401:1433 --name sql1 \
   -d microsoft/mssql-server-linux:2017-latest
```

3. View Containers and check if the sql server container is up and running
```
sudo docker ps -a | grep sql 
```

4. Use SQL Server Management Studio to connect to your running instance. Attempt for the port number format given below: 
```
server : <your ip number / .>,1401
user : sa
password : strong5password1avoid2special3characters4
```
One must be able at this point to use docker sql server just like any given sql server windown machine.

> The following steps are from the tutorial refer to machine name and sa password changing. Refer to it in case of need on any of those matters
> The Connect to SQL Server contains detailed enough information to enter and manipulate the sql server data and database structure from a command line tool named `sqlcmd`. It is useful to master some techniques, because we never know when they will come in handy


### Stop the Container
```
sudo docker stop sql1
```

### Delete the Container
```
sudo docker rm sql1
```
 

