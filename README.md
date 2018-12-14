# Introduction
A minimal Docker image based on Alpine Linux with Nginx
which is dynamically configured using ConfD.

This is a basic example of how to use confd with Docker environment variables
to set run-time configuration for containers.

# Quick Start Guide

```
// build image
docker build -t nginx-confd .

// run nginx with confd listening to etcd
docker run -it -p 3000:80 \
  --env SERVER_NAME=sample.com \
  --env ETCD_NODES=http://35.229.162.77:2379,http://35.229.232.238:2379,http://35.221.194.187:2379 \
  --name nginx-confd \
  nginx-confd

// browse to http://localhost:3000/, the youtube.com should be shown

// change config in etcd
ETCDCTL_API=3 etcdctl --endpoints="http://35.229.162.77:2379,http://35.229.232.238:2379,http://35.221.194.187:2379" put /nginx/www/server_name google.com

// refresh http://localhost:3000/, the google.com should be shown
```

