# Offical Docker Images

```bash
docker pull jenkins/jenkins:lts
```

# Run Master Node

```bash
docker run --name jenkins-master -p 8080:8080 -p 53801:53801 -p 50000:50000 jenkins/jenkins:lts
```

- Open http://localhost:8080
- Enter value from "/var/jenkins_home/secrets/initialAdminPassword"
  - c90ccfac24504f35b7474403840d177e
- Install suggested plugins

# API

## View

- Get All Views

curl -vvv --user admin:117bfce832492987fa8af9c67c4f86459f \
http://localhost:8080/api/json?pretty&tree=views[name,url,jobs[name,url]] | jq

## Jobs

- Query State
  curl -vvv --user admin:117bfce832492987fa8af9c67c4f86459f http://localhost:8080/job/wip/job/PipelineJob/api/json | jq

- Who-Am-I
  curl -vvv -X POST -u admin:117bfce832492987fa8af9c67c4f86459f -H "Side: upload" -H "Session: 58e0a7d7-eebc-11d8-9669-0800200c9a66" -H "Content-Type: application/octet-stream" -H "Transfer-Encoding: chunked" --data-binary "@curl.txt" http://${JENKINS_HOST}:8080/cli?remoting=false

# SSH CLI

# Find SSH Port

```bash
curl -Lv ${JENKINS_URL}/login 2>&1 | grep -i 'X-SSH-Endpoint'
```

# Display Help

```bash
# help [COMMAND]
ssh -l admin -p 53801 ${JENKINS_HOST} help
```

# Who-Am-I

```bash
# who-am-i
ssh -l admin -p 53801 ${JENKINS_HOST} who-am-i
```

# Execute a Job

```bash
# build JOB [-c] [-f] [-p] [-r N] [-s] [-v] [-w]
ssh -l admin -p 53801 ${JENKINS_HOST} build job-name -f -v
```

# Display Console of Job

```bash
# console JOB [BUILD] [-f] [-n N]
ssh -l admin -p 53801 ${JENKINS_HOST} console job-name
```
