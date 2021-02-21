docker stop jenkins-master

docker rm $(docker ps -qa --no-trunc --filter "status=exited")
docker volume rm $(docker volume ls -qf dangling=true)

