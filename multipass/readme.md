# Random Info

```bash
multipass launch --cpus 3 --memory 6G --disk 25G --name k8s-master
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
sudo apt install -y \
  software-properties-common build-essential \
  libtool autoconf pkg-config libffi-dev libssl-dev libsasl2-dev unzip cmake net-utils
```

### [SQLite]

```bash
sudo apt-get install -y sqlite3
```

### [Python]

```bash
sudo add-apt-repository ppa:deadsnakes/ppa

sudo apt-get install -y python3.11-full python3.11-dev
sudo apt-get install -y python3-apt

curl -sS https://bootstrap.pypa.io/get-pip.py | python3.11
python3 -m pip install --upgrade pip

sudo update-alternatives --list python3
sudo update-alternatives --config python3

sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 1
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.11 2

Error: No module named 'apt_pkg'
> cd /usr/lib/python3/dist-packages
> sudo ln -s apt_pkg.cpython-38-aarch64-linux-gnu.so apt_pkg.so

Error: aarch64-linux-gnu-gcc' Python.h: No such file or directory
> sudo apt-get install -y python3.11-dev
> export CPPFLAGS="-Wno-write-strings -I/usr/include/python3.11"
> pip3 install duckdb==0.3.4
```

### [Golang]

```bash
curl -sSLO https://go.dev/dl/go1.21.4.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.21.4.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
```

### [Java]

```bash
sudo apt-get install -y openjdk-8-jdk
sudo apt-get install -y openjdk-17-jdk

sudo update-alternatives --list java
sudo update-alternatives --config java
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

curl -SL https://github.com/docker/compose/releases/download/v2.23.0/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

sudo groupadd docker
sudo usermod -aG docker $USER
```

### [NerdCTL]

```bash
sudo apt-get install -y uidmap
curl -sSLO https://github.com/containerd/nerdctl/releases/download/v1.7.0/nerdctl-full-1.7.0-linux-amd64.tar.gz
sudo tar -C /usr/local -xzf nerdctl-full-1.7.0-linux-amd64.tar.gz
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
