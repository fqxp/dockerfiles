from fqxp/base

env DEBIAN_FRONTEND noninteractive

run apt-get update
run apt-get install -y --force-yes apache2

# disable default site configuration
run a2dismod default default-ssl

expose 80 443

cmd /start.sh
