FROM ubuntu:14.04
MAINTAINER Christopher De Vries <devries@idolstarastronomer.com>

RUN apt-get update && apt-get install -y software-properties-common && apt-get clean

RUN add-apt-repository ppa:nginx/development
RUN apt-get update && apt-get install -y nginx && apt-get clean

RUN sed "s/access_log\s*[^;]*/access_log \/dev\/stdout/g" -i /etc/nginx/nginx.conf
RUN sed "s/error_log\s*[^;]*/error_log \/dev\/stdout/g" -i /etc/nginx/nginx.conf
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

EXPOSE 80
EXPOSE 443

CMD ["/usr/sbin/nginx"]
