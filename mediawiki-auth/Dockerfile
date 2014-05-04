from fqxp/mediawiki

run mkdir /srv/mediawiki/extensions/Auth_remoteuser

add https://codeload.github.com/wikimedia/mediawiki-extensions-Auth_remoteuser/legacy.tar.gz/REL1_21 /tmp/auth-remoteuser.tgz

run tar -xzf /tmp/auth-remoteuser.tgz -C /srv/mediawiki/extensions/Auth_remoteuser --strip-components=1
run grep -q Auth_remoteuser /srv/mediawiki/includes/DefaultSettings.php || echo 'require_once "$IP/extensions/Auth_remoteuser/Auth_remoteuser.php";\n$wgAuth = new Auth_remoteuser();\n' >>/srv/mediawiki/includes/DefaultSettings.php
