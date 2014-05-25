from fqxp/mediawiki

run mkdir /srv/mediawiki/extensions/Auth_remoteuser

add https://codeload.github.com/wikimedia/mediawiki-extensions-Auth_remoteuser/legacy.tar.gz/REL1_21 /tmp/auth-remoteuser.tgz

run tar -xzf /tmp/auth-remoteuser.tgz -C /srv/mediawiki/extensions/Auth_remoteuser --strip-components=1

add setup-mediawiki-auth.sh /setup.d/20-setup-mediawiki-auth.sh
