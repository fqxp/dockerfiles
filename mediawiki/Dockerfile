from fqxp/nginx-php
maintainer Frank Ploss <frank@fqxp.de>

env DEBIAN_FRONTEND noninteractive
env MEDIAWIKI_VERSION_MAJOR 1.22
env MEDIAWIKI_VERSION_MINOR 6

run apt-get update
run apt-get install -y php5-mcrypt php5-sqlite php5-mysql sqlite php5-gd php5-intl imagemagick pwgen mysql-client wget

run wget -O - http://releases.wikimedia.org/mediawiki/${MEDIAWIKI_VERSION_MAJOR}/mediawiki-${MEDIAWIKI_VERSION_MAJOR}.${MEDIAWIKI_VERSION_MINOR}.tar.gz | tar xzf - -C /srv
#add mediawiki-${MEDIAWIKI_VERSION_MAJOR}.${MEDIAWIKI_VERSION_MINOR}.tar.gz /srv/
run mv /srv/mediawiki-${MEDIAWIKI_VERSION_MAJOR}.${MEDIAWIKI_VERSION_MINOR} /srv/mediawiki
run chown -R www-data /srv/mediawiki/mw-config
run ln -sf /srv/mediawiki/config/LocalSettings.php /srv/mediawiki/LocalSettings.php

add site.conf /etc/nginx/sites-enabled/default

add entrypoint.sh /entrypoint.sh

volume /srv/mediawiki/images
volume /srv/mediawiki/config

expose 80

entrypoint ["/entrypoint.sh"]
cmd ["/usr/bin/supervisord", "--nodaemon"]
