# Setup

```bash
minikube start --cpus 4 --memory=6000 --disk-size 15G --vm true --insecure-registry
minikube ip
minikube addons enable registry
minikube addons enable metrics-server
minikube addons enable dashboard
minikube addons enable ingress
minikube addons list
minikube dashboard
kubectl create deployment hello-minikube --image=k8s.gcr.io/echoserver:1.4
kubectl expose deployment hello-minikube --type=NodePort --port=8080
minikube service hello-minikube
curl http://$(minikube ip):32575
eval $(minikube docker-env)
docker build -t foo:0.0.1 .
kubectl run hello-foo --image=foo:0.0.1 --image-pull-policy=Never
kubectl get pods
minikube stop
minikube delete --all
```

# SSH into Pod

```bash
kubectl get pods
kubectl describe pod jenkins-7ff8998f79-ghw2h
kubectl exec --stdin --tty jenkins-7ff8998f79-ghw2h -- /bin/bash
kubectl cp /path/to/your_folder name-of-your-pod:/path/to/destination_folder
kubectl cp ./bin/tools-cli jenkins-7ff8998f79-ghw2h:/var/jenkins_home/tools/
```

# Socat (to enable pushing to Registry)

```bash
docker run --rm -it --network=host alpine ash -c "apk add socat && socat TCP-LISTEN:5000,reuseaddr,fork TCP:$(minikube ip):5000"
```

# Rescaling

```bash
kubectl scale deployment [deployment_name] --replicas=0
kubectl scale deployment [deployment_name] --replicas=1
```
