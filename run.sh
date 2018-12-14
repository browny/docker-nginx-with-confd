#!/bin/sh

# verify environment variables are set
if [[ -z "$SERVER_NAME" ]]; then
  echo SERVER_NAME variable missing;
  exit 1;
fi

if [[ -z "$ETCD_NODES" ]]; then
  echo ETCD_NODES variable missing;
  exit 1;
fi

# generate configs
/bin/confd -watch -backend etcd -node=$ETCD_NODES -log-level=debug &

# start nginx foreground
echo "start nginx ..."
exec /usr/sbin/nginx -g 'daemon off;'
