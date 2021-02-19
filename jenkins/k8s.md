# Testing

```bash
docker pull jenkins/jenkins:lts
docker tag jenkins/jenkins:lts localhost:5000/jenkins
docker push localhost:5000/jenkins

kubectl create deployment jenkins --image=localhost:5000/jenkins
kubectl expose deployment jenkins --type=NodePort --port=8080,53801,50000
http://192.168.64.8:32731
```