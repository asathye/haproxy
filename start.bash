#!/bin/bash

#
# start.bash
#

HAPROXY="/etc/haproxy"
OVERRIDE="/haproxy-override"
PIDFILE="/var/run/haproxy.pid"

CONFIG="haproxy.cfg"
ERRORS="errors"

cd "$HAPROXY"

# Symlink errors directory
if [[ -d "$OVERRIDE/$ERRORS" ]]; then
  mkdir -p "$OVERRIDE/$ERRORS"
  rm -fr "$ERRORS"
  ln -s "$OVERRIDE/$ERRORS" "$ERRORS"
fi

# Symlink config file.
if [[ -f "$OVERRIDE/$CONFIG" ]]; then
  rm -f "$CONFIG"
  ln -s "$OVERRIDE/$CONFIG" "$CONFIG"
fi

#handle standard interupts
trap "service haproxy reload" SIGHUP SIGUSR1
trap "service haproxy stop; exit 0" SIGTERM

service haproxy start

while :
do
    read inp
    echo $inp > /dev/null
done

