FROM ubuntu

MAINTAINER Felipe Daniel

RUN apt-get update
RUN export TZ=America/Sao_Paulo
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get install -y nginx 
RUN apt-get install -y php7.2 \
	php7.2-dev
RUN apt-get clean

ADD ./configs/nginx.conf /etc/nginx/sites-enabled/default

RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

CMD service nginx start -g 


