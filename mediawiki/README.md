# A Debian-based mediawiki Docker container

# Setup

Create two directories `LOCAL_DATA_DIR` and `LOCAL_LOG_DIR` on the server.
Create a directory `images` in `LOCAL_DATA_DIR` if you want to let users
upload files. `chown www-data.www-data LOCAL_DATA_DIR` and `chmod 755
LOCAL_DATA_DIR`.

The mediawiki image needs a running `orchardup/mysql` instance to work.

# Running the first time

When running the image the first with a given `LOCAL_DATA_DIR`, the image checks
if a `LocalSettings.php` does yet exist. If not, it will create a
`LocalSettings.php` file.

Here is an example of how to run a mediawiki image:

    docker run -d \
      -e MEDIAWIKI_DBNAME=test_wiki
      -e MEDIAWIKI_DBUSER=test_wiki_user
      -e MEDIAWIKI_DBPASS=very-secure
      -e MEDIAWIKI_LANG=de
      -e MEDIAWIKI_ADMIN_USER=Admin
      -e MEDIAWIKI_ADMIN_PASS=even-more-secure
      -e MEDIAWIKI_SITENAME="Test Wiki"
      -e MEDIAWIKI_SERVER=http://localhost:8080
      -v /srv/test_wiki/data:/srv/data \
      -v /srv/test_wiki/log:/var/log/apache2 \
      --link=hopeful_mclean:mysql
      -p 8080:80 fqxp/mediawiki

This will start a web server on the server port 8080 which is accessible via the
URL `http://localhost:8080`. Page URLs will have the form
`http://localhost:8080/w/Page_Name`.

It is linked to the running `orchardup/mysql` named `hopeful_mclean`.

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
