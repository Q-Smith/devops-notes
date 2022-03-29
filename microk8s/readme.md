# Notes

```bash

sudo snap install microk8s --classic
sudo usermod -a -G microk8s $USER

mkdir -p ~/.kube
sudo chown -f -R $USER ~/.kube
microk8s config view > ~/.kube/config

microk8s status --wait-ready
microk8s kubectl get nodes
microk8s kubectl get services
microk8s kubectl get pods

vi ~/.bash_profile
alias mk='microk8s'
alias kc='mk kubectl'
alias kubectl='mk kubectl'

microk8s enable dns
microk8s enable storage
microk8s enable ingress
microk8s enable registry
microk8s enable metrics-server
microk8s enable prometheus

microk8s add-node --token <token>
microk8s join 192.168.64.2:25000/<token>
```
