#!/bin/bash

namespace="keycloak"
realm_name="basic"

while true; do
    # Get the current phase for the KeycloakRealm
    phase=$(kubectl get keycloakrealm "$realm_name" -n "$namespace" -o=jsonpath='{.status.phase}')

    # Check if the phase is "reconciling"
    if [ "$phase" == "reconciling" ]; then
        echo "KeycloakRealm is in the 'reconciling' phase."
        break
    else
        echo "KeycloakRealm is not in the 'reconciling' phase. Current phase: $phase"
        # Add additional actions or notifications if needed

        # For example, break out of the loop if certain conditions are met
        break
    fi

    # Sleep for 2 seconds before the next iteration
    sleep 2
done
