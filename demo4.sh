#create data container

docker create -v /var/lib/mysql --name=mysql-data mysql:5.6 /bin/true

#inspect data directory
docker run --volumes-from=mysql-data ubuntu /bin/bash -c "ls /var/lib/mysql;echo done"

#create mysql container

export SILLY_PASSWORD=welcometothejungle

docker create --name mysql-db --volumes-from=mysql-data -e MYSQL_ROOT_PASSWORD=$SILLY_PASSWORD -p 3306:3306 mysql:5.6

docker start mysql-db

#reinspect
docker run --volumes-from=mysql-data ubuntu /bin/bash -c "ls /var/lib/mysql;echo done"

#connect from dbvis
open -a dbvisualizer --args -connection 'DOCKER MYSQL'

#remember to create a database

#link container for phpmyadmin
docker stop mysql-db

docker rm mysql-db

docker create --name mysql-db --volumes-from=mysql-data -e MYSQL_ROOT_PASSWORD=$SILLY_PASSWORD mysql:5.6

docker start mysql-db

open -a dbvisualizer --args -connection 'DOCKER MYSQL'

docker run -d --link mysql-db:mysql -e MYSQL_USERNAME=root --name phpmyadmin -p 8001:80 corbinu/docker-phpmyadmin

open -a firefox http://$(boot2docker ip):8001


