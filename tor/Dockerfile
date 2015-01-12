from debian:wheezy

run apt-get update
run DEBIAN_FRONTEND=noninteractive apt-get install -y tor

expose 9050

cmd ["/usr/sbin/tor"]
