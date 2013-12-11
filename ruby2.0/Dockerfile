from fqxp/apache2

env DEBIAN_FRONTEND noninteractive

run apt-get update
run apt-get install -y --force-yes curl sudo gcc make libssl-dev libreadline-dev

# install ruby
#add http://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p353.tar.gz /tmp/ruby.tgz
add ruby-2.0.0-p353.tar.gz /tmp/ruby.tgz
run tar -C /root -xzf /tmp/ruby.tgz && rm /tmp/ruby.tgz
run cd /root/ruby-2.0.0-p353 && ./configure && make && make install
