# Notes

## Starting (with import)
```bash
docker run -d --rm --name keycloak \
  -p 8090:8080 \
  -e KEYCLOAK_USER=admin \
  -e KEYCLOAK_PASSWORD=admin \
  jboss/keycloak
```

## Importing

```bash
add this...
-e KEYCLOAK_IMPORT=/tmp/astro-realm.json -v $(pwd)/devops-realm.json:/tmp/devops-realm.json
```

## Exporting

```bash
docker exec -it keycloak /opt/jboss/keycloak/bin/standalone.sh \
  -Djboss.socket.binding.port-offset=100 -Dkeycloak.migration.action=export \
  -Dkeycloak.migration.provider=singleFile \
  -Dkeycloak.migration.realmName=devops \
  -Dkeycloak.migration.usersExportStrategy=REALM_FILE \
  -Dkeycloak.migration.file=/tmp/devops_realm.json
```

add realm
- devops

add user federation provider
- ldap
- vendor= Other
- edit mode=WRITEABLE
- Username LDAP attribute = cn
- RDN LDAP attribute = cn
- UUID LDAP attribute = uid
- user object class= inetOrgPerson,organizationalPerson
- connection= ldap://openldap.local:389
- users dn=  ou=People,dc=acme,dc=local
- bind dn=  cn=admin,dc=acme,dc=local

add client and default mappings
- client id = jenkins
- root url = http://jenkins.local:8010
- openid-connect
- Access Type = confidential

add user
- qsmith

http://keycloak.local:8080/auth/admin
http://keycloak.local:8080/auth/realms/devops/account

http://keycloak.local:8080/auth/realms/devops/.well-known/openid-configuration

# Research

- https://github.com/keycloak/keycloak-quickstarts
- https://joostvdg.github.io/blogs/kubernetes-sso-keycloak/
- https://stackoverflow.com/questions/56042425/how-to-set-role-based-login-for-jenkins-in-keycloak