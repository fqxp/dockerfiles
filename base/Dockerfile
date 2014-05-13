from tianon/debian:wheezy
maintainer Frank Ploss <frank@fqxp.de>

env DEBIAN_FRONTEND noninteractive

run apt-get update
run apt-get upgrade -y
run apt-get install -y --force-yes supervisor openssh-server less
run mkdir -p /var/run/sshd /var/run/supervisor

# set up SSH login
run install -m 700 -d /root/.ssh
run install -m 600 /dev/null /root/.ssh/authorized_keys

# prohibit SSH password-only authentication
run sed -i.bak 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config

# set locale (to fix perl locale warnings)
run localedef -c -i en_US -f UTF-8 en_US.UTF-8 || :

# create directory for optional setup scripts
run install -m 755 -d /setup.d

# set up startup via supervisor
add sshd.conf /etc/supervisor/conf.d/
add start.sh /

expose 22

cmd /start.sh
