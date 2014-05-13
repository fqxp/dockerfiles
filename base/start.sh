#! /bin/sh

if [ -n "$AUTHORIZED_KEYS" ]; then
  echo "$AUTHORIZED_KEYS" > /root/.ssh/authorized_keys
else
  mv /etc/supervisor/conf.d/sshd.conf /etc/supervisor/conf.d/sshd.conf.disabled
fi

find /setup.d -type f -executable -exec {} \;

/usr/bin/supervisord --nodaemon
