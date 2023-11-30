# keycloak-api

# Create KeyCloakGroup
```
mastertoken=$(curl -k -g -d "client_id=admin-cli" -d "username=admin" -d "password=<password>" -d "grant_type=password" -d "client_secret=" "https://keycloak-keycloak.apps.524vf.dynamic.opentlc.com/auth/realms/master/protocol/openid-connect/token" | sed 's/.*access_token":"//g' | sed 's/".*//g')

curl -k https://keycloak-keycloak.apps.524vf.dynamic.opentlc.com/auth/admin/realms/basic/groups -H "Content-Type: application/json" -H "Authorization: bearer $mastertoken" --data '{"name":"group2"}'
```
