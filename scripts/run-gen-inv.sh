#!/bin/sh

if [ -z "$1" ]; then
    echo "usage: ${0##*/} <host>"
    exit 1
fi

host=$1

# fakecloud
host_ip=$(vm_ip.sh $host)
if [ -z "$host_ip" ]; then
    echo "couldn't find ip for '$host'"
    exit 1
fi

set -e
scp -o 'loglevel fatal' gen-inv.sh $host_ip:/tmp >/dev/null
ssh -x root@$host_ip "/tmp/gen-inv.sh"
