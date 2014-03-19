#!/bin/sh

me=$(echo ${SSH_CONNECTION} |awk '{ print $3 }')
target_address=${1:-$me}

docker ps --no-trunc --quiet \
    |while read id; do
        hostname=$(docker inspect -f '{{ .Config.Hostname }}' $id)
        host_ip=$(docker inspect -f '{{ .NetworkSettings.IPAddress }}' $id)
        nat_port=$(docker port $id 22 |cut -f2 -d:)
        echo "$hostname ansible_ssh_port=$nat_port ansible_ssh_host=$target_address"
    done

