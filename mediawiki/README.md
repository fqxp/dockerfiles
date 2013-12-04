Run with:

    docker run -d -v $LOCAL_DATA_DIR:/srv/data -v $LOCAL_LOG_DIR:/var/log/apache2 -p $LOCAL_PORT:80 fqxp/mediawiki

The LOCAL_DATA_DIR will contain the `LocalSettings.php` file and the SQLite
database. Adjust `LocalSettings.php` to your needs.
