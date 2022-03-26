# [MacOS]

- defaults write com.apple.Finder AppleShowAllFiles true
- killall Finder

# [brew]

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew info <package>
brew search <search term>
brew list <already installed term>

brew install cask
brew install awk
brew install git
brew install git-lfs
brew install wget
brew install curl
brew install htop
brew install tree
brew install telnet
brew install nmap
brew install socat
brew install iperf
brew install nano
brew install bash
brew install bash-completion
brew install zsh (https://ohmyz.sh/)
brew install zsh-completions
brew install jq
brew install yq
brew install openssl
brew install openssh
brew install gcc
brew install make
brew install nasm
brew install cntlm
brew install rbenv (rbenv install -l)
brew install pyenv (pyenv install -l; 2.7.18; 3.10.2) - must use bash; not zsh
brew install nodenv (nodenv install -l; nodenv global 17.4.0)
brew install jenv (openjdk@8; openjdk@11; jenv add ...; jenv global 11.0.12)
brew install go
brew install --cask dotnet-sdk
brew install sqlite
brew install mysql-client

brew install bower
brew install grunt
brew install scala
brew install maven
brew install gradle
brew install bazel
brew install qemu
brew install mitmproxy
brew install ffmpeg
brew install gifsicle
brew install graphviz
brew install kops
brew install helm
brew install krew
brew install kustomize
brew install kubebuilder
brew install terraform
brew install terraform-docs
brew install protobuf
brew install ansible
brew install --cask powershell
brew install --cask virtualbox
brew install --cask multipass
brew install --cask google-cloud-sdk -> (export CLOUDSDK_PYTHON=python3.9)
brew install aquasecurity/trivy/trivy
brew install operator-sdk
brew install argocd
brew install argoproj/tap/kubectl-argo-rollouts
brew install airwindsOps/tap/rbac-lookup (--output wide --kind user)

kubectl krew install ktop (kc ktop)
kubectl krew install images (kc images -A)
kubectl krew install access-matrix (kc access-matrix)
kubectl krew install sql
```

# [Oh My ZSH]

```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

https://gist.github.com/DukeNgn/9312a65e1535b3b1bffd9fed2c892079
git clone https://github.com/powerline/fonts.git
```

# [IDEs]

- Eclipse
- VS Code

# [NPM]

```bash
npm install -g http-server
npm install -g smee-client
```

# [Other]

- brew install mike-engel/jwt-cli/jwt-cli
- Postman
- KeyPass (from Self-Service)
- Rancher Desktop



