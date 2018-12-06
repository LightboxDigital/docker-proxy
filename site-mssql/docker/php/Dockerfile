FROM php:7.1.9-fpm

# Automatically accept licence agreement
ENV ACCEPT_EULA=Y

# Install any custom system requirements
RUN set -ex; \
	apt-get update \
	&& curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
	&& curl https://packages.microsoft.com/config/debian/8/prod.list \
		> /etc/apt/sources.list.d/mssql-release.list \
	&& apt-get install -y --no-install-recommends \
		locales \
		apt-transport-https \
		curl \
		libjpeg-dev \
		libpng-dev \
		vim \
		zlib1g-dev \
		libxml2-dev \
		php-soap \
	&& echo "en_US.UTF-8 UTF-8" > /etc/locale.gen \
	&& locale-gen \
	&& apt-get update \
	&& apt-get -y --no-install-recommends install \
		msodbcsql \
		unixodbc-dev \

	&& rm -rf /var/lib/apt/lists/* ; \

# Install various PHP extensions
	docker-php-ext-install mbstring pdo pdo_mysql \
	&& docker-php-ext-configure soap --enable-soap \
    && pecl install sqlsrv pdo_sqlsrv xdebug \
    && docker-php-ext-enable sqlsrv pdo_sqlsrv xdebug \
	&& docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
	&& docker-php-ext-configure pdo_mysql --with-pdo-mysql \
	&& docker-php-ext-install \
		gd \
		mysqli \
		opcache \
		zip \
		pdo \
		pdo_mysql \
		soap;

COPY php.ini /usr/local/etc/php/conf.d/
