#!/bin/bash -x

# MEDIAWIKI_DBNAME:     MySQL database name to use
# MEDIAWIKI_DBUSER:     MySQL username to use
# MEDIAWIKI_DBPASS:     MySQL user password
MEDIAWIKI_DBPASS=${MEDIAWIKI_DBPASS:-$(pwgen -cn 12)}
# MEDIAWIKI_LANG:       Wiki language
MEDIAWIKI_LANG=${MEDIAWIKI_LANG:-en}
# MEDIAWIKI_ADMIN_USER: MediaWiki administrator username
MEDIAWIKI_ADMIN_USER=${MEDIAWIKI_ADMIN_USER:-WikiSysop}
# MEDIAWIKI_ADMIN_PASS: MediaWiki administrator password
# MEDIAWIKI_SITENAME:   Name of the wiki
# MEDIAWIKI_SERVER:     The protocol and server name to use in fully-qualified URLs

MEDIAWIKI_SCRIPTPATH=$MEDIAWIKI_SERVER

MEDIAWIKI_DIR=/srv/mediawiki
DATA_DIR=/srv/data

LOCAL_SETTINGS=${MEDIAWIKI_DIR}/LocalSettings.php
EXTRA_LOCAL_SETTINGS=${DATA_DIR}/LocalSettings.php

# Add DB user and grant privileges
mysql -u root -p${MYSQL_ENV_MYSQL_ROOT_PASSWORD} -h ${MYSQL_PORT_3306_TCP_ADDR} <<EOF
  CREATE DATABASE IF NOT EXISTS ${MEDIAWIKI_DBNAME};
  DROP USER '${MEDIAWIKI_DBUSER}';
  GRANT INDEX, CREATE, SELECT, INSERT, UPDATE, DELETE, ALTER, LOCK TABLES
    ON ${MEDIAWIKI_DBNAME}.*
    TO '${MEDIAWIKI_DBUSER}' IDENTIFIED BY '${MEDIAWIKI_DBPASS}';
  FLUSH PRIVILEGES;
EOF

# Create LocalSettings.php
cd ${MEDIAWIKI_DIR}/maintenance
php5 install.php \
  --conf ${MEDIAWIKI_DIR}/LocalSettings.php \
  --dbname $MEDIAWIKI_DBNAME \
  --dbserver $MYSQL_PORT_3306_TCP_ADDR \
  --dbtype mysql \
  --dbuser "$MEDIAWIKI_DBUSER" \
  --dbpass "$MEDIAWIKI_DBPASS" \
  --lang "$MEDIAWIKI_LANG" \
  --pass "$MEDIAWIKI_ADMIN_PASS" \
  --scriptpath "$MEDIAWIKI_SCRIPTPATH" \
  "$MEDIAWIKI_SITENAME" \
  "$MEDIAWIKI_ADMIN_USER"

# - enable pretty URLs starting from base
# - include extra local settings
cat >>${LOCAL_SETTINGS} <<EOF
\$wgArticlePath = "/w/\$1";
\$wgUsePathInfo = true;
\$wgEnableUploads = true;
\$wgFileExtensions = array(
'png', 'gif', 'jpg', 'jpeg', 'doc',
'xls', 'mpp', 'pdf', 'ppt', 'tiff', 'bmp', 'docx', 'xlsx',
'pptx', 'ps', 'odt', 'ods', 'odp', 'odg'
);

include '${EXTRA_LOCAL_SETTINGS}';
EOF

# Override incorrect default logo path
sed -i "s#^\\\$wgLogo\s*= \"/wiki\(.*\)\";\$#\$wgLogo = \"\1\";#" ${LOCAL_SETTINGS}

sed -i \
  -e "s#^\\\$wgDBserver = \(.*\);\$#\$wgDBserver = \"${MYSQL_PORT_3306_TCP_ADDR}\";#" \
  -e "s#^\\\$wgDBname = \(.*\);\$#\$wgDBname = \"${MEDIAWIKI_DBNAME}\";#" \
  -e "s#^\\\$wgDBuser = \(.*\);\$#\$wgDBuser = \"${MEDIAWIKI_DBUSER}\";#" \
  -e "s#^\\\$wgDBpassword = \(.*\);\$#\$wgDBpassword = \"${MEDIAWIKI_DBPASS}\";#" \
  -e "s#^\\\$wgScriptPath = \(.*\);\$#\$wgScriptPath = \"${MEDIAWIKI_SCRIPTPATH}\";#" \
  -e "s#^\\\$wgServer = \(.*\);\$#\$wgServer = \"${MEDIAWIKI_SERVER}\";#" \
  -e "s#^\\\$wgLanguageCode = \(.*\);\$#\$wgLanguageCode = \"${MEDIAWIKI_LANG}\";#" \
  ${LOCAL_SETTINGS}
