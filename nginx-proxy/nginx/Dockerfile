FROM jwilder/nginx-proxy:latest

RUN set -ex; \
	sed -i '/jessie-updates/d' /etc/apt/sources.list && \ 
	apt-get update; \
	apt-get install -y \
		vim \
	; \
