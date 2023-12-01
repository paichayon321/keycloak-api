#!/bin/bash

# Check if all required parameters are provided
if [ "$#" -ne 5 ]; then
    echo "Usage: $0 <admin_username> <admin_password> <keycloak_url> <realm> <groupname>"
    exit 1
fi

kuser="$1"
kpass="$2"
kurl="$3"
realm="$4"
groupname="$5"

# Get master token on master realms
mastertoken=$(curl -k -g -d "client_id=admin-cli" -d "username=$kuser" -d "password=$kpass" -d "grant_type=password" -d "client_secret=" "$kurl/auth/realms/master/protocol/openid-connect/token" | sed 's/.*access_token":"//g' | sed 's/".*//g')

# Sample add group in "basic" realms
curl -k $kurl/auth/admin/realms/$realm/groups -H "Content-Type: application/json" -H "Authorization: bearer $mastertoken" --data "{\"name\": \"$groupname\"}"
