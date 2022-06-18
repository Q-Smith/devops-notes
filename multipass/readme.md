# Random Info

```bash
multipass launch --cpus 3 --mem 6G --disk 25G --name k8s-master
multipass mount ~/_Projects/Personal/go/ k8s-master:/code/
multipass shell k8s-master
multipass stop k8s-master
multipass delete k8s-master
multipass purge
```

### [Make]

```bash
sudo apt-get update
sudo apt-get -y upgrade
sudo apt install -y make gcc g++
```

### [Golang]

```bash
curl -sSLO https://go.dev/dl/go1.18.3.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.18.3.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
```

### [Helm]

```bash
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
helm plugin install https://github.com/chartmuseum/helm-push.git
```

### [Docker]

```bash
sudo apt-get update
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

sudo groupadd docker
sudo usermod -aG docker $USER
```

### [NerdCTL]

```bash
sudo apt-get install -y uidmap
curl -sSLO https://github.com/containerd/nerdctl/releases/download/v0.20.0/nerdctl-full-0.20.0-linux-amd64.tar.gz
sudo tar -C /usr/local -xzf nerdctl-full-0.20.0-linux-amd64.tar.gz
containerd-rootless-setuptool.sh install
containerd-rootless-setuptool.sh install-buildkit
```

### [Podman]

```bash
. /etc/os-release
echo "deb https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_${VERSION_ID}/ /" | sudo tee /etc/apt/sources.list.d/devel:kubic:libcontainers:stable.list

curl -L "https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_${VERSION_ID}/Release.key" | sudo apt-key add -

sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y install podman
```
