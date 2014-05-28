#! /bin/bash

if [ -n "$AUTHORIZED_KEYS" ]; then
  echo "$AUTHORIZED_KEYS" > /root/.ssh/authorized_keys
else
  mv /etc/supervisor/conf.d/sshd.conf /etc/supervisor/conf.d/sshd.conf.disabled
fi

for script in $(find /setup.d -type f -executable | sort); do
  $script
done

/usr/bin/supervisord --nodaemon
