from fqxp/rails4

run sudo apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
run echo 'deb http://downloads-distro.mongodb.org/repo/debian-sysvinit dist 10gen' > /etc/apt/sources.list.d/mongodb.list

env DEBIAN_FRONTEND noninteractive

run apt-get update
run apt-get install -y --force-yes mongodb-10gen

volume ["/var/log/mongodb"]
expose 27017

cmd ["/usr/bin/mongod", "--config", "/etc/mongodb.conf"]
