# Installing OSS

```bash
docker pull releases-docker.jfrog.io/jfrog/artifactory-oss:latest
docker tag releases-docker.jfrog.io/jfrog/artifactory-oss:latest localhost:5000/jfrog
docker push localhost:5000/jfrog

kubectl create deployment jfrog --image=localhost:5000/jfrog
kubectl expose deployment jfrog --type=NodePort --port=8081,8082
http://192.168.64.8:31234/ui
admin/Admin123
```

```bash
helm upgrade --kubeconfig ${HOME}/.kube/k3s.yaml --install artifactory-oss --set artifactory.postgresql.postgresqlPassword=password --namespace op-tools center/jfrog/artifactory-oss
```

# Uninstalling

```bash
helm delete artifactory-oss --namespace op-tools --kubeconfig ${HOME}/.kube/k3s.yaml
```