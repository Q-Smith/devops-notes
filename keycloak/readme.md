# Notes

docker run -p 8080:8080 -e KEYCLOAK_USER=admin -e KEYCLOAK_PASSWORD=admin quay.io/keycloak/keycloak:12.0.3

add realm
- devops

add client and default mappings
- jenkins

add user
- qsmith

http://keycloak.local:8080/auth/admin
http://keycloak.local:8080/auth/realms/devops/account

http://keycloak.local:8080/auth/realms/devops/.well-known/openid-configuration

# Research

- https://github.com/keycloak/keycloak-quickstarts
- https://joostvdg.github.io/blogs/kubernetes-sso-keycloak/
- https://stackoverflow.com/questions/56042425/how-to-set-role-based-login-for-jenkins-in-keycloak