ARG WORDPRESS_VERSION=5.7.0
FROM wordpress:$WORDPRESS_VERSION

ARG XDEBUG_VERSION=3.0.3

RUN pecl install xdebug-$XDEBUG_VERSION \
	&& docker-php-ext-enable xdebug \
	&& php -v
