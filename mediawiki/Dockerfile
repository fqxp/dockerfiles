from fqxp/nginx

env DEBIAN_FRONTEND noninteractive

run apt-get update
run apt-get install -y php5-fpm php5-cli php-apc php5-mcrypt php5-sqlite php5-mysql sqlite php5-gd php5-intl imagemagick pwgen mysql-client

# Download and setup MediaWiki
#add http://releases.wikimedia.org/mediawiki/1.22/mediawiki-1.22.6.tar.gz /tmp/mediawiki.tgz
add mediawiki-1.22.6.tar.gz /srv/
run mv /srv/mediawiki-1.22.6 /srv/mediawiki
run chown -R root.www-data /srv/mediawiki
run chown -R www-data.www-data /srv/mediawiki/mw-config
run rm -rf /srv/mediawiki/images
run ln -sf /srv/data/images /srv/mediawiki/images

# Add MediaWiki to nginx
add mediawiki.conf /etc/nginx/sites-enabled/

# Add MediaWiki to supervisord
add php5-fpm.conf /etc/supervisor/conf.d/

add setup-mediawiki.sh /setup.d/10-setup-mediawiki.sh

volume /srv/data
volume /var/log/nginx
expose 80

cmd /start.sh
