docker rm $(docker ps -a | grep esb)
docker rmi $(docker images | grep esb)
