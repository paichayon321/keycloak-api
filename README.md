# keycloak-api

# Create KeyCloakGroup
Change password for your own

```
# Get master token on master realms
kpass=xxxxxx
mastertoken=$(curl -k -g -d "client_id=admin-cli" -d "username=admin" -d "password=$kpass" -d "grant_type=password" -d "client_secret=" "https://keycloak-keycloak.apps.524vf.dynamic.opentlc.com/auth/realms/master/protocol/openid-connect/token" | sed 's/.*access_token":"//g' | sed 's/".*//g')

# Sample add group in "basic" realms
curl -k https://keycloak-keycloak.apps.524vf.dynamic.opentlc.com/auth/admin/realms/basic/groups -H "Content-Type: application/json" -H "Authorization: bearer $mastertoken" --data '{"name":"group2"}'

# Sample add group with attribute in "basic" realms
curl -k https://keycloak-keycloak.apps.524vf.dynamic.opentlc.com/auth/admin/realms/basic/groups -H "Content-Type: application/json" -H "Authorization: bearer $mastertoken" --data '{"name":"group3","attributes":{"gid":["1243"]}}'
```
---

# Get all keycloak client 

```
kpass=xxxxxx
mastertoken=$(curl -k -g -d "client_id=admin-cli" -d "username=admin" -d "password=$kpass" -d "grant_type=password" -d "client_secret=" "https://keycloak-keycloak.apps.524vf.dynamic.opentlc.com/auth/realms/master/protocol/openid-connect/token" | sed 's/.*access_token":"//g' | sed 's/".*//g')
curl -k -X GET "https://keycloak-keycloak.apps.524vf.dynamic.opentlc.com/auth/admin/realms/basic/clients" -H "Authorization: Bearer $mastertoken"

```
