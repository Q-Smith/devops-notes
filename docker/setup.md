# Install

```bash
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get update
sudo apt-get install \
    net-tools \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli docker-compose containerd.io
sudo vi /lib/systemd/system/docker.service
  ExecStart=/usr/bin/dockerd -H tcp://0.0.0.0:4243 -H unix:///var/run/docker.sock
sudo systemctl daemon-reload
sudo service docker restart
curl http://localhost:4243/version
```

# Secure the Daemon's Socket

```bash
cd ~/.docker/
HOST=C02SC9NHG8WN
openssl genrsa -aes256 -out ca-key.pem 4096
  > secret
openssl req -new -x509 -days 365 -key ca-key.pem -sha256 -out ca.pem
  > secret
  > US
  > Georgia
  > Columbus
  > Personal
  > Personal
  > $HOST
  > <email>
openssl genrsa -out server-key.pem 4096
openssl req -subj "/CN=$HOST" -sha256 -new -key server-key.pem -out server.csr
echo subjectAltName = DNS:$HOST,IP:192.168.1.214,IP:127.0.0.1 >> extfile.cnf
echo extendedKeyUsage = serverAuth >> extfile.cnf
openssl x509 -req -days 365 -sha256 -in server.csr -CA ca.pem -CAkey ca-key.pem \
  -CAcreateserial -out server-cert.pem -extfile extfile.cnf
```

```bash
vi ~/.docker/daemon.json
{
    "debug": true,
    "experimental": true,
    "tls": true,
    "tlsverify": true,
    "tlscacert": "/Users/quinnsmith/.docker/ca.pem",
    "tlskey": "/Users/quinnsmith/.docker/server-key.pem",
    "tlscert": "/Users/quinnsmith/.docker/server-cert.pem",
    "hosts": [
        "unix:///var/run/docker.sock",
        "tcp://0.0.0.0:2376"
    ]
}
```