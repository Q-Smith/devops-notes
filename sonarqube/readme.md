# Testing

```bash
docker pull sonarqube:lts
docker tag sonarqube:lts localhost:5000/sonarqube
docker push localhost:5000/sonarqube

kubectl create deployment sonarqube --image=localhost:5000/sonarqube
kubectl expose deployment sonarqube --type=NodePort --port=9000
http://192.168.64.8:32163
admin/admin
```