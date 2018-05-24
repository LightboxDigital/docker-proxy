FROM php:7.1.9-fpm

# Install any custom system requirements
RUN set -ex; \
	apt-get update; \
	apt-get install -y \ 
		curl \ 
		libjpeg-dev \
		libpng-dev \
		vim \
		zlib1g-dev \ 
		libxml2-dev \ 
		php-soap \ 
	&& apt-get clean -y \ 
	&& rm -rf /var/lib/apt/lists/* ; \ 

# Install various PHP extensions
	docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr && \ 
	#docker-php-ext-configure soap --enable-soap && \ 
    docker-php-ext-configure pdo_mysql --with-pdo-mysql; \
	docker-php-ext-install \ 
		gd \ 
		mysqli \ 
		opcache \ 
		zip \ 
		pdo \ 
		pdo_mysql \ 
		soap; 

COPY php.ini /usr/local/etc/php/conf.d/

