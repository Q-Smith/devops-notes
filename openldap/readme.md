# Notes

ldapsearch -x -H ldap://localhost:10389 -b "dc=acme,dc=local" -D "uid=admin,ou=system" -w secret
ldapsearch -x -H ldap://localhost:10389 -b "uid=qsmith,ou=Users,dc=acme,dc=local" -D "uid=admin,ou=system" -w secret
ldapadd -v -h localhost:10389 -c -x -D uid=admin,ou=system -w secret -f ~/_QSmith/Data/openldap/config/acme.ldif

sed -i '' -e "s/openmicroscopy/acme/g" ome.ldif ./conf/config.ldif ./conf/ads-contextentry.decoded
sed -i '' -e "s/dc=org/dc=local/g" ./ome.ldif ./conf/config.ldif ./conf/ads-contextentry.decoded
sed -i '' -e "s/dc: org/dc: local/g" ./ome.ldif ./conf/config.ldif ./conf/ads-contextentry.decoded

# Docker

Mount .ldif in /container/service/slapd/assets/config/bootstrap/ldif directory if you want to overwrite image default bootstrap ldif files or in /container/service/slapd/assets/config/bootstrap/ldif/custom (recommended) to extend image config.

```bash
docker run -d --rm --name ldap \
  -p 389:389 \
  -p 636:636 \
  -e LDAP_ORGANISATION="ACME Inc." \
	-e LDAP_DOMAIN="acme.local" \
	-e LDAP_ADMIN_PASSWORD="admin" \
  osixia/openldap

docker cp ~/_Projects/GPN/astro-ops/artifacts/openldap/config/acme.ldif ldap:/tmp/acme.ldif
docker exec ldap ldapadd -v -x -H ldap://localhost -D "cn=admin,dc=acme,dc=local" -w admin -f /tmp/acme.ldif
docker exec ldap ldapsearch -v -x -H ldap://localhost -D "cn=admin,dc=acme,dc=local" -w admin -b "dc=acme,dc=local"
```

# References

https://www.digitalocean.com/community/tutorials/how-to-use-ldif-files-to-make-changes-to-an-openldap-system