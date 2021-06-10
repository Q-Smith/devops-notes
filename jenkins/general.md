# Offical Docker Images

```bash
docker pull jenkins/jenkins:lts
```

# Run Master Node

```bash
docker run -d --rm --name jenkins-master \
  -p 8080:8080 -p 53801:53801 -p 50000:50000 \
  -e ASTRO_ACTIONS_DIR=/var/jenkins_home/actions \
  -e ASTRO_CACHETOOLS_DIR=/var/jenkins_home/cache \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v astro-dir-cache:/var/jenkins_home/cache:rw \
  -v astro-dir-work:/var/jenkins_home/workspace:rw \
  -v astro-dir-actions:/var/jenkins_home/actions:rw \
  jenkins/jenkins:lts
# -v /usr/local/bin/docker:/usr/bin/docker
```

- Open http://localhost:8080
- Enter value from "/var/jenkins_home/secrets/initialAdminPassword"
  - 8e4f76f945c6455d9e000079e2cbd802
- Install suggested plugins

# Keycloak

- Install keycloak plugin
- Set ${KEYCLOAK_URL}/auth/realms/${REALM}/.well-known/openid-configuration
http://keycloak.local:8080/auth/realms/devops/.well-known/openid-configuration
preferred_username
name
email
group-membership


# API

## View

- Get All Views

curl -vvv --user qsmith:11d9ff0a3730aae0afecd5edd4f7efc92c \
http://jenkins.local:9020/api/json?pretty&tree=views[name,url,jobs[name,url]] | jq

## Jobs

- Query State
  curl -vvv --user admin:11d9ff0a3730aae0afecd5edd4f7efc92c http://localhost:8080/job/wip/job/PipelineJob/api/json | jq

- Who-Am-I
  curl -vvv -X POST -u admin:11d9ff0a3730aae0afecd5edd4f7efc92c -H "Side: upload" -H "Session: 58e0a7d7-eebc-11d8-9669-0800200c9a66" -H "Content-Type: application/octet-stream" -H "Transfer-Encoding: chunked" --data-binary "@curl.txt" http://${JENKINS_HOST}:8080/cli?remoting=false

- Generate API Token
  curl -sS --cookie-jar ./cookie -u admin:admin 'http://localhost:8080/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)'
  curl -sS --cookie ./cookie -u admin:admin -H 'Jenkins-Crumb:aea86d9e4f1ce5f07ac4e2865048e5a192cc55d2ee505f929b39455e73cedc8a' 'http://localhost:8080/user/admin/descriptorByName/jenkins.security.ApiTokenProperty/generateNewToken' -X POST --data 'newTokenName=AUTO_GEN' 

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

# Credentials

```bash
stage('Dump Credentials') {
  steps {
    script {
      sh '''
        curl -L "https://github.com/hoto/jenkins-credentials-decryptor/releases/download/0.0.5-alpha/jenkins-credentials-decryptor_0.0.5-alpha_$(uname -s)_$(uname -m)" -o jenkins-credentials-decryptor

        chmod +x jenkins-credentials-decryptor

        ./jenkins-credentials-decryptor -m $JENKINS_HOME/secrets/master.key -s $JENKINS_HOME/secrets/hudson.util.Secret -c $JENKINS_HOME/credentials.xml 
      '''
    }
  }
}
```

# References

https://www.digitalocean.com/community/tutorials/how-to-automate-jenkins-setup-with-docker-and-jenkins-configuration-as-code
https://www.praqma.com/stories/start-jenkins-config-as-code/
https://github.com/jenkinsci/configuration-as-code-plugin/tree/master/demos
https://support.cloudbees.com/hc/en-us/articles/115000105752-how-do-i-setup-okta-as-identity-provider-in-jenkins-
https://medium.com/@alexshulyak/helm-ed-jenkins-for-k8s-in-details-6b286a3a894f
https://dev.to/setevoy/jenkins-saml-okta-user-groups-and-role-based-security-plugin-3mfj
https://www.jasonmars.org/2020/04/21/deploy-jenkins-service-in-kubernetes-quick/
https://technologists.dev/posts/cjd-casc/
https://technologists.dev/posts/tekton-jx-pipelines/
https://technologists.dev/posts/windows-containers/