# Testing

```bash
docker pull gitea/gitea:1.13.1
docker tag gitea/gitea:1.13.1 localhost:5000/gitea
docker push localhost:5000/gitea

kubectl create deployment gitea --image=localhost:5000/gitea
kubectl expose deployment gitea --type=NodePort --port=3000
http://192.168.64.8:32245
administrator/administrator

http://192.168.64.8:32245/EntArch/astro-demo-todo-webapi
```