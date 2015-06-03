#Start the boot2docker host and initialize shell variables

boot2docker up

#Search for an image on docker hub
docker search jira
open -a firefox  http://hub.docker.com

#run the jira image

docker run -d --publish 8080:8080 cptactionhank/atlassian-jira

#teamcity

docker run -d --publish 8111:8111 sjoerdmulder/teamcity

#drupal

docker run -d -p 8112:80 drupal

# open them all in a browser

open -a firefox http://$(boot2docker ip):8080 http://$(boot2docker ip):8111 http://$(boot2docker ip):8112
