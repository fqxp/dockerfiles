from debian:wheezy
maintainer Frank Ploss <frank@fqxp.de>

env DEBIAN_FRONTEND noninteractive

run apt-get update
run apt-get install -y --force-yes nginx-light supervisor

add site.conf /etc/nginx/sites-available/default
add supervisor.conf /etc/supervisor/conf.d/nginx.conf

expose 80

volume /srv/www

cmd ["/usr/bin/supervisord", "--nodaemon"]
