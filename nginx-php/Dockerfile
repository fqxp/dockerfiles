from fqxp/nginx

env DEBIAN_FRONTEND noninteractive

run apt-get update
run apt-get install -y php5-fpm php5-cli

add site.conf /etc/nginx/sites-available/default
add supervisor.conf /etc/supervisor/conf.d/php5-fpm.conf

run echo 'cgi.fix_pathinfo=0' >>/etc/php5/fpm/php.ini

expose 80

volume /srv/www

cmd ["/usr/bin/supervisord", "--nodaemon"]
