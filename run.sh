#!/bin/bash

: ${ADVERTISED_HOSTNAME}
: ${ZOOKEEPER_URL}

if [[ -n ${ADVERTISED_HOSTNAME} ]]; then
  echo "host.name=${ADVERTISED_HOSTNAME}" >> /etc/schema-registry/schema-registry.properties
fi

if [[ -n ${ZOOKEEPER_URL} ]]; then
  sed -e "s/kafkastore.connection.url=.*/kafkastore.connection.url=${ZOOKEEPER_URL}/" \
    -i /etc/schema-registry/schema-registry.properties
fi

exec ./bin/schema-registry-start /etc/schema-registry/schema-registry.properties
