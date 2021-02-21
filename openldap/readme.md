
ldapsearch -x -H ldap://localhost:10389 -b "dc=acme,dc=local" -D "uid=admin,ou=system" -w secret
ldapsearch -x -H ldap://localhost:10389 -b "uid=qsmith,ou=Users,dc=acme,dc=local" -D "uid=admin,ou=system" -w secret
ldapadd -v -h localhost:10389 -c -x -D uid=admin,ou=system -w secret -f ~/_QSmith/Data/openldap/config/acme.ldif

sed -i '' -e "s/openmicroscopy/acme/g" ome.ldif ./conf/config.ldif ./conf/ads-contextentry.decoded
sed -i '' -e "s/dc=org/dc=local/g" ./ome.ldif ./conf/config.ldif ./conf/ads-contextentry.decoded
sed -i '' -e "s/dc: org/dc: local/g" ./ome.ldif ./conf/config.ldif ./conf/ads-contextentry.decoded

https://www.digitalocean.com/community/tutorials/how-to-use-ldif-files-to-make-changes-to-an-openldap-system