#!/bin/sh

# verify environment variables are set
if [[ -z "$SERVER_NAME" ]]; then
  echo SERVER_NAME variable missing;
  exit 1;
fi

# generate configs
/bin/confd -config-file="/etc/confd/confd.toml" &

# start nginx foreground
echo "start nginx ..."
exec /usr/sbin/nginx -g 'daemon off;'
