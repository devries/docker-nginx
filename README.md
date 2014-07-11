# Bottle Base Docker Image

The Dockerfile included in the repository creates an image based on the
ubuntu14.04 image with nginx installed. 

The file `/etc/nginx/nginx.conf` is modified to turn off daemon mode and to
log the access_log and error_log to stdout. Ports 80 and 443 are exposed by
default. 

You can serve static content by attaching a volume of content from the host to
the container, i.e.:

~~~~~
docker run -v /path/to/content:/usr/share/nginx/html -p 0.0.0.0:80:80 -d devries/nginx
~~~~~

You can use the container with a custom proxy configuration by putting proxy
info in a directory and using that directory as the `sites-enabled` location
in the container, i.e.:

~~~~~
docker run -v /path/to/proxy/config/directory:/etc/nginx/sites-enabled -p 0.0.0.0:80:80 -d devries/nginx
~~~~~


