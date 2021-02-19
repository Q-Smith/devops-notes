# Notes

docker run -p 8080:8080 -e KEYCLOAK_USER=admin -e KEYCLOAK_PASSWORD=admin quay.io/keycloak/keycloak:12.0.3

add realm
- ops.local

add user
- qsmith

http://localhost:8080/auth/admin
http://localhost:8080/auth/realms/ops.realm/account

# Research

- https://github.com/keycloak/keycloak-quickstarts
- https://stackoverflow.com/questions/56042425/how-to-set-role-based-login-for-jenkins-in-keycloak