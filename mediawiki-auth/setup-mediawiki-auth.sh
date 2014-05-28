#!/bin/bash -x

if ! grep -q Auth_remoteuser /srv/mediawiki/LocalSettings.php ; then
  cat >>/srv/mediawiki/LocalSettings.php <<EOF

require_once("\$IP/extensions/Auth_remoteuser/Auth_remoteuser.php");
\$wgAuth = new Auth_remoteuser();
EOF
fi
