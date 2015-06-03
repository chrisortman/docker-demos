#kick up an ubuntu image 

docker run -it ubuntu /bin/bash

#make changes verify, exit and check changes
echo "Hello World" > /home/foo.txt
cat /home/foo.txt
exit
docker run -it ubuntu /bin/bash
cat /home/foo.txt
echo "Hello World" > /home/foo.txt
cat /home/foo.txt
exit


#show containers
docker ps

#last container
docker ps -l

#just with id
docker ps -lq

# show changes
docker diff $(docker ps -lq)

#commit my change

docker commit -a 'Chris Ortman' -m 'Add foo' $(docker ps -lq) demo:latest

# create new container and see change

docker run -it demo:latest /bin/bash
cat /home/foo.txt
exit

# show commit message

docker images -a --no-trunc | head -n4 | grep -v "IMAGE ID" | awk '{ print $3 }' | xargs docker inspect | grep Comment


