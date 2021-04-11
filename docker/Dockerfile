ARG WORDPRESS_VERSION=5.7.0
FROM wordpress:$WORDPRESS_VERSION

ARG XDEBUG_VERSION=3.0.3
ARG BUILD_ENV=production

#RUN pecl install xdebug-$XDEBUG_VERSION \
#	&& docker-php-ext-enable xdebug

RUN URL=https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && curl -o /usr/bin/wp -fsSL $URL \
  && chmod +x /usr/bin/wp

RUN	php -v
