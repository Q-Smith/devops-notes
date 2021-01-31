# Image Commands

## List the images we have pulled

```bash
docker image ls
```

# Create an Image From a Container

```bash
docker commit <container id> <image-name>:<tag>
```

# Clean Up

```bash
docker rm $(docker ps -qa --no-trunc --filter "status=exited")
docker volume rm $(docker volume ls -qf dangling=true)
docker rmi $(docker images --filter "dangling=true" -q --no-trunc)
```