from tianon/debian:wheezy

run apt-get update
run apt-get install -y apache2

env APACHE_RUN_USER www-data
env APACHE_RUN_GROUP www-data
env APACHE_LOG_DIR /var/log/apache2

volume ["/var/log/apache2"]
expose 80

cmd ["/usr/sbin/apache2", -D", "FOREGROUND", "-X"]
