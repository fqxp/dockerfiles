# A Debian-based mediawiki Docker container

Run with, e.g.:

    docker run -d -v $LOCAL_DATA_DIR:/srv/data -v $LOCAL_LOG_DIR:/var/log/apache2 -p $LOCAL_PORT:80 fqxp/mediawiki

The LOCAL_DATA_DIR will contain the `LocalSettings.php` file and the SQLite
database.

Then, use the MediaWiki installer by visiting `http://localhost:$LOCAL_PORT`
adjust the generated `LocalSettings.php` to your needs and install it in `$LOCAL_DATA_DIR`.
