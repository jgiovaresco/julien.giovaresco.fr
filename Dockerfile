FROM php:5.5-apache

RUN a2enmod rewrite && service apache2 restart

# Enable xsl support
RUN apt-get update && apt-get install -y libxslt1.1 libxslt-dev --no-install-recommends && rm -r /var/lib/apt/lists/*
RUN docker-php-ext-install xsl


