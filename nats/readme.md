# Setup

```bash
docker pull nats:latest
docker tag nats:latest localhost:5000/nats
docker push localhost:5000/nats

kubectl create deployment nats --image=localhost:5000/nats
kubectl expose deployment nats --type=NodePort --port=4222,6222,8222
http://192.168.64.8:32620
```