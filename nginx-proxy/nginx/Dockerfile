FROM jwilder/nginx-proxy:latest

RUN { \
      echo 'server_tokens off;'; \
      echo 'client_max_body_size 100m;'; \
    } > /etc/nginx/conf.d/default.conf

#RUN set -ex; \
#	\
#	apt-get update; \
#	apt-get install -y \
#		vim \
#	; \
