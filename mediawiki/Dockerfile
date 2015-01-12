from fqxp/nginx-php
maintainer Frank Ploss <frank@fqxp.de>

env DEBIAN_FRONTEND noninteractive

run apt-get update
run apt-get install -y php5-mcrypt php5-sqlite php5-mysql sqlite php5-gd php5-intl imagemagick pwgen mysql-client pwgen

add http://releases.wikimedia.org/mediawiki/1.22/mediawiki-1.22.6.tar.gz /tmp/mediawiki.tgz
#add mediawiki-1.22.6.tar.gz /srv/
run mv /srv/mediawiki-1.22.6 /srv/mediawiki
run chown -R www-data /srv/mediawiki/mw-config
run ln -sf /srv/mediawiki/config/LocalSettings.php /srv/mediawiki/LocalSettings.php

add site.conf /etc/nginx/sites-enabled/default

add entrypoint.sh /entrypoint.sh

volume /srv/mediawiki/images
volume /srv/mediawiki/config

expose 80

entrypoint ["/entrypoint.sh"]
cmd ["/usr/bin/supervisord", "--nodaemon"]
