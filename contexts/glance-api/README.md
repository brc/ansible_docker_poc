# glance-api 
## Build
```
docker build -t duck/glance-api glance-api
```

## Run
```
# poor man's scraper
IFACE=eth0
ADDR=$(ip a s ${IFACE} |grep -w inet |awk '{print $2}' |cut -f1 -d/)

docker run --detach --hostname ${HOSTNAME} --name glance-api \
    --publish ${ADDR}:9292:9292 duck/glance-api
```
