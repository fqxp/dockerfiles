# Mediawiki with REMOTE\_USER authentication

This is based on the fqxp/mediawiki container, but with additional
authentication via the REMOTE\_USER HTTP header using the
[Auth\_remoteuser.php](http://www.mediawiki.org/wiki/Extension:Auth_remoteuser)
Mediawiki extension.

To make use of this, the HTTP server must be configured to require
HTTP authentication.

Add the following lines to the end of LocalSettings.php:

    require_once("\$IP/extensions/Auth_remoteuser/Auth_remoteuser.php");
    \$wgAuth = new Auth_remoteuser();
