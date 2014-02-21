# A docker base image with SSH access

The image `fqxp/base` provides a Debian-based docker container, derived from
`tianon/debian:wheezy`. It features supervisor-managed pluggable services and
SSH access, plus some convenience stuff.

## Building the container

Build the container:

    cd $BASE_DIR
    docker build -t fqxp/base .

This installs supervisor, the SSH daemon and does some basic setup. For
convenience, `less` is also installed.

## Starting the container

To start this container (or a container derived from this), use something like

    docker run -t -i -p 127.0.0.1:2222:22 -e "AUTHORIZED_KEYS=$(cat ~/.ssh/id_rsa.pub)" fqxp/base

The contents of the `AUTHORIZED_KEYS` environment variable will be added to
`/root/.ssh/authorized_keys`.

## Access through SSH

Afterwards, you can enter the container using SSH:

    ssh root@localhost -p 2222

## Deriving from `fqxp/base`
Set up and running supervisor are provided by the script `/start.sh`, so you
need to run this by default. You may add additional services by adding
supervisor config files to `/etc/supervisor/conf.d`. Consult the 
[supervisor documentation](http://supervisord.org/) for info on how to do this.

Dockerfiles adding services will therefore have a basic structure like this:

    from fqxp/base

    # set up application
    apt-get install -y ...
    ...

    # install supervisor config file which starts my daemon
    add MYSERVICE.conf /etc/supervisor/conf.d/

    # run setup and supervisord
    run /start.sh