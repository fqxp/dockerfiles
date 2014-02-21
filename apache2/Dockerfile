from fqxp/base
maintainer Frank Ploss <frank@fqxp.de>

env DEBIAN_FRONTEND noninteractive

run apt-get update
run apt-get install -y --force-yes apache2

# add apache2 supervisor service
add apache2.conf /etc/supervisor/conf.d/

# disable default site configuration
run rm /etc/apache2/sites-enabled/*

expose 80 443

cmd /start.sh
