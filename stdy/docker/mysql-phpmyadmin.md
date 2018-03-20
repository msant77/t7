# MySql and PHPMyAdmin setup 
[from - https://blog.thenets.org/how-to-install-mysql-and-phpmyadmin-with-docker/](https://blog.thenets.org/how-to-install-mysql-and-phpmyadmin-with-docker/)


## Install MySql

Create a directory for database data and create the container.

```
mkdir -p /opt/mysql  # Create dir for database data
docker run --name mysql \                  # Container name
       -v /opt/mysql:/var/lib/mysql \      # Volume path
       -e MYSQL_ROOT_PASSWORD=pass_here \  # Root password
       -p 3306:3306 \                      # Port
       -d mysql                            # Run as daemon
```


## Create phpMyAdmin container

The following command will create a phpMyAdmin container. You will need to link to MySQL container, so the phpMyAdmin can connect and access databases.

Works on Linux and Windows:

```
docker run --name phpmyadmin \    # Container name
       --link mysql:db \          # Link to MySQL container
       -p 8080:80 \               # Port
       -d phpmyadmin/phpmyadmin   # Run as daemon
```


