# Image Commands

## List the images we have pulled

```bash
docker image ls
```

# Create an Image From a Container

```bash
docker commit <container id> <image-name>:<tag>
```

# Copy Local Files into Container
```bash
mkdir -p /gpn/apps/astro
chown -R jenkins:jenkins /gpn/
docker cp ./bin/astro-cli jenkins-master:/gpn/apps/astro/astro-cli
ln -s /gpn/apps/astro/astro-cli /usr/bin/astro-cli
ls -l /usr/bin/astro-cli
```

# Clean Up

```bash
docker system prune -f

docker rm $(docker ps -qa --no-trunc --filter "status=exited")
docker volume rm $(docker volume ls -qf dangling=true)
docker rmi $(docker images --filter "dangling=true" -q --no-trunc)
```

# CURL Commands

```bash

curl \
  --unix-socket /var/run/docker.sock \
  -H "Content-Type: application/json" \
  -d '{"Image": "act-hello-world:latest", "Cmd": ["joe soap"]}' \
  -X POST http://localhost/containers/create

curl \
  --unix-socket /var/run/docker.sock \
  -X POST http://localhost/containers/2e7cb0b49f92336b90ee0c051b0924e5733c71d209f66326df03ac2032bfa3a6/start

curl \
  --unix-socket /var/run/docker.sock \
  -X POST http://localhost/containers/2e7cb0b49f92336b90ee0c051b0924e5733c71d209f66326df03ac2032bfa3a6/wait

curl \
  --unix-socket /var/run/docker.sock \
  "http://localhost/containers/2e7cb0b49f92336b90ee0c051b0924e5733c71d209f66326df03ac2032bfa3a6/logs?stdout=1"

curl \
  --unix-socket /var/run/docker.sock \
  -X POST http://localhost/containers/2e7cb0b49f92336b90ee0c051b0924e5733c71d209f66326df03ac2032bfa3a6/stop

```