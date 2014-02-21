# Apache2 base image

A Debian-based image for apache2-based application containers. All default
sites are removed.

## Deriving from `fqxp/apache2`

When deriving from this image, install additional sites directly
to `/etc/apache2/sites-enabled`. Or install to `/etc/apache2/sites-available`
and `run a2ensite SITECONFIG` if you like that better.

Add `cmd /start.sh` to start supervisor which in turn runs apache2.
