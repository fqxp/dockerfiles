A simple nginx image based on Debian wheezy.

The default configuration defines `/srv/www` as the document root.

This image can be used as a base for images based on nginx. 
It makes sense to overwrite the default site in
`/etc/nginx/sites-available/default` or to add others.
