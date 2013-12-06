from fqxp/apache2

env DEBIAN_FRONTEND noninteractive

run apt-get update
run apt-get install -y libapache2-mod-php5 php5-cli php-apc php5-mcrypt php5-sqlite sqlite php5-gd php5-intl
run a2enmod php5

add http://download.wikimedia.org/mediawiki/1.21/mediawiki-1.21.3.tar.gz /tmp/mediawiki.tgz
#add mediawiki-1.21.3.tar.gz /tmp/mediawiki.tgz
run mkdir -p /srv/mediawiki
run tar -xzf /tmp/mediawiki.tgz -C /srv/mediawiki --strip-components=1
run chown -R root.www-data /srv/mediawiki
run chown -R www-data.www-data /srv/mediawiki/mw-config

run rm -rf /srv/mediawiki/images
run ln -s /srv/data/LocalSettings.php /srv/mediawiki/LocalSettings.php
run ln -s /srv/data/images /srv/mediawiki/images

add apache2.conf /etc/apache2/sites-available/default

volume ["/srv/data", "/var/log/apache2"]
expose 80

cmd ["/usr/sbin/apache2", "-D", "FOREGROUND", "-X"]
