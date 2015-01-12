# A Debian-based mediawiki Docker container

# Setup
Create directories for configuration and images (if you want to enable uploads)
and make the images directory writable for the nginx image, e.g. like this:

    mkdir /srv/mediawiki/config /srv/mediawiki/images
    chown www-data /srv/mediawiki/images

# Running the first time

Run the image like this:

    docker run -d -e MEDIAWIKI_DB_NAME=test_wiki -e MEDIAWIKI_DB_USER=test_wiki_user \
      -e MEDIAWIKI_DB_PASSWORD=very-secure -v /srv/test_wiki/config:/srv/mediawiki/config \
      -v /srv/test_wiki/images:/srv/mediawiki/images --link=hopeful_mclean:mysql
      -p 8080:80 fqxp/mediawiki

This will start a web server on the server port 8080 which is accessible via the
URL `http://localhost:8080`.

To install the database tables and create `LocalSettings.php`, configure
MediaWiki at `http://localhost:8080/mw-config/index.php`

Page URLs will have the form `http://localhost:8080/w/Page_Name`.

## Environment variables

Unless otherwise noted, it is necessary to set all of these environment
variables:

- `MEDIAWIKI_DBNAME`: MySQL database name to use.
- `MEDIAWIKI_DBUSER`: MySQL username to use.
- `MEDIAWIKI_DBPASS`: MySQL user password _(default: generate)_.
- `MEDIAWIKI_LANG`: Wiki language _(default: en)_.
- `MEDIAWIKI_ADMIN_USER`: MediaWiki administrator username _(default:
  WikiSysop)_.
- `MEDIAWIKI_ADMIN_PASS`: MediaWiki administrator password.
- `MEDIAWIKI_SITENAME`: Name of the wiki.
- `MEDIAWIKI_SERVER`: The protocol and server name to use in fully-qualified
  URLs. This is the base URL under which the wiki will be accessible. If put
  behind a reverse proxy, you need to use the public URL here. Example:
  `http://example.com`.

## SSH access

The image has optional SSH access, see the `fqxp/base` image for further info on
this.
