from fqxp/base
maintainer Frank Ploss <frank@fqxp.de>

env DEBIAN_FRONTEND noninteractive

run apt-get update
run apt-get install -y --force-yes nginx-light

# add nginx supervisor service
add nginx.conf /etc/supervisor/conf.d/

# disable default site configuration
run rm /etc/nginx/sites-enabled/default

expose 80 443

cmd /start.sh
