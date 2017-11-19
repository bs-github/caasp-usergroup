#!/bin/bash

if [ -z ${CAASP_ADMIN_NODE} ]
then
  echo
  echo "ERROR: You must supply the address for the CaaS Platform Admin node as CAASP_ADMIN_NODE=<hostname>."
  exit 1
fi
OPENLDAP_CONTAINER_ID=$(ssh root@${CAASP_ADMIN_NODE} docker ps | grep openldap | awk '{ print $1 }')

#ssh -qt root@${CAASP_ADMIN_NODE} docker exec -i '$(docker ps | grep openldap | awk '{ print $1 }')' cat /var/lib/misc/infra-secrets/openldap-password
ssh -qt root@${CAASP_ADMIN_NODE} docker exec -i ${OPENLDAP_CONTAINER_ID} cat /var/lib/misc/infra-secrets/openldap-password
