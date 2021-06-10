# General Notes

## Install Kubectl

```bash
sudo apt-get update && sudo apt-get install -y apt-transport-https gnupg2 curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
```

## Dashboard

```bash
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0/aio/deploy/recommended.yaml
kubectl proxy
http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/
```

## Commands

```bash
kubectl --insecure-skip-tls-verify --kubeconfig ~/.kube/rancher.config cluster-info dump
kubectl --insecure-skip-tls-verify --kubeconfig ~/.kube/rancher.config config get-contexts
kubectl config current-context
kubectl config view
kubectl config view | grep token

kubectl get namespaces --show-labels
kubectl get pods --all-namespaces
kubectl get pods -o wide
kubectl get services

kubectl --insecure-skip-tls-verify --kubeconfig ~/.kube/rancher.config logs -n ct-dev hello-world-774496fb99-rhlfb
kubectl --insecure-skip-tls-verify --kubeconfig ~/.kube/rancher.config attach -it -n ct-dev -c hello-world hello-world-774496fb99-rhlfb

kubectl --insecure-skip-tls-verify --kubeconfig ~/.kube/rancher.config run my-shell -n ct-dev --image alpine -- ping -c 2 artifactory.<redacted>.com
```

## Deleting Resources

```bash
kubectl get pods,services,deployments,jobs,daemonset
kubectl delete deployments --all
kubectl delete services --all
kubectl delete pods --all
kubectl delete daemonset --all
```

## RBAC

Concepts
- Subject : Users, groups or service accounts.
- Resources : Kubernetes API objects which we will operate on.
- Verbs : The operations which we want to do with our resources

Main Roles
- Admin (rw)
- Editor (rw)
- Viewer (ro)

- Developers	container.developer
- Operations	container.admin
- Security    container.viewer, security.admin
- Network     network.admin

# Reference

https://www.conftest.dev/examples/
https://gkesecurity.guide/cluster_configuration/
https://kubernetes.io/docs/reference/kubectl/cheatsheet/
https://github.com/ahmetb/kubernetes-network-policy-recipes/
https://github.com/GoogleCloudPlatform/kubernetes-engine-samples
https://github.com/GoogleCloudPlatform/golang-samples
https://medium.com/google-cloud/kubernetes-nodeport-vs-loadbalancer-vs-ingress-when-should-i-use-what-922f010849e0

https://github.com/arashkaffamanesh/practical-kubernetes-problems
https://github.com/arashkaffamanesh/multipass-rke-rancher
https://github.com/kubernauts/bonsai