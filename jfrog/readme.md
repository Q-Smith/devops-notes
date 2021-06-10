# Installing OSS

```bash
docker pull releases-docker.jfrog.io/jfrog/artifactory-oss:latest
docker tag releases-docker.jfrog.io/jfrog/artifactory-oss:latest localhost:5000/jfrog
docker push localhost:5000/jfrog

docker run --name artifactory --rm -d -p 8081:8081 -p 8082:8082 releases-docker.jfrog.io/jfrog/artifactory-oss:latest

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

# Abbreviations

```bash
p    = ping
cp   = copy
mv   = move
del  = delete
u    = upload
dl   = download
s    = search
cl   = curl
dp   = docker-push
dpl  = docker-pull
dpr  = docker-promote
bs   = build-scan
bp   = build-publish
ba   = build-append
bpr  = build-promote
```

# REST API

```bash
curl -vv -H "X-JFrog-Art-Api:<redacted>" -X GET "https://<redacted>/artifactory/api/security/apiKey"

curl -vv -H "X-JFrog-Art-Api:<redacted>" -O https://<redacted>/artifactory/libs-snapshot/com/fasterxml/jackson/core/jackson-core/2.10.0/jackson-core-2.10.0-javadoc.jar

curl -vv -H "X-JFrog-Art-Api:<redacted>" --upload-file "./target/astro-demo-maven-1.0.0.jar" https://<redacted>/artifactory/libs-snapshot-local/com/demo/astro/astro-demo-maven-1.0.0.jar
```

# CLI

```bash
curl -fL https://getcli.jfrog.io | sh
chmod +x ./jfrog
./jfrog config remove artifactory --quiet
if ! grep -q cibuild "/var/jenkins_home/.jfrog/jfrog-cli.conf.v5"; then
  ./jfrog config add artifactory --interactive=false --user=cibuild --artifactory-url=https://artifactory.redacted.com/artifactory --apikey=<key>
fi
./jfrog config show
./jfrog config use artifactory
./jfrog rt ping
./jfrog rt u target/astro-demo-maven-1.0.0.jar libs-snapshot-local/com/demo/astro/
./jfrog rt dl "libs-snapshot/com/fasterxml/jackson/core/jackson-core/2.10.0/jackson-core-2.10.0.jar"
ls -al ~/.jfrog
ls -al

export JFROG_CLI_LOG_LEVEL=DEBUG
jfrog rt u -spec /path/to/spec/upload_spec.json
jfrog rt dl -spec /path/to/spec/download_spec.json
jfrog rt mv -spec /path/to/spec/move_spec.json
jfrog rt cp -spec /path/to/spec/copy_spec.json
jfrog rt del -spec /path/to/spec/delete_spec.json
jfrog rt s -spec /path/to/specs/search_spec.json
```

```bash
# Create and publish build a/1
jfrog rt u "a/*.zip" generic-local --build-name a --build-number 1
jfrog rt bp a 1
# Create and publish build v/1
jfrog rt u "b/*.zip" generic-local --build-name b --build-number 1
jfrog rt bp b 1
# Append builds a/1 and b/1 to build aggregating-build/10
jfrog rt ba aggregating-build 10 a 1
jfrog rt ba aggregating-build 10 b 1
# Publish build aggregating-build/10
jfrog rt bp aggregating-build 10
# Promoting a Build
jfrog rt bpr my-build-name 18 target-repository
```

```bash
cat <<EOF > .jfrog_spec_ul.json
{"files": [
  {
    "pattern": "$WORKSPACE/$GIT_OWNER/$GIT_REPO/target/astro-demo-maven-1.0.0.jar",
    "target": "libs-snapshot-local/com/demo2/astro/"
  }
]}
EOF
```

# Repositories / Registries

## Package Formats
alpine
bower
cargo
chef
cocoapods
conan
conda
CRAN
debian
docker
Git LFS
go
gradle
helm
maven
npm
nuget
opkg
P2
PHP
puppet
pypi
rpm
rubygems
sbt
vagrant
vcs

# References

https://www.jfrog.com/confluence/display/CLI/JFrog+CLI
https://www.jfrog.com/confluence/pages/viewpage.action?pageId=51187805#JFrogCLI-DownloadingFiles
https://www.jfrog.com/confluence/display/JFROG/Artifactory+REST+API
https://jfrog.com/blog/use-file-specs-in-your-cicd-to-get-full-control-of-your-artifacts/
https://github.com/jfrog/jfrog-cli-plugins/tree/main/build-report
https://github.com/jfrog/jfrog-integrations/blob/master/sonarqube/artifactory/artifactory-sonar.sh