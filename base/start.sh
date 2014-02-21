#! /bin/sh

if [ -n "$AUTHORIZED_KEYS" ]; then
  echo "$AUTHORIZED_KEYS" > /root/.ssh/authorized_keys
fi

/usr/bin/supervisord --nodaemon
