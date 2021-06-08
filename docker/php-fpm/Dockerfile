FROM php:7.4-fpm
ENV DEBIAN_FRONTEND=noninteractive

# Install components
RUN apt-get update -y && apt-get install -y \
		curl \
		git-core \
		libcurl4-openssl-dev \
		libgd-dev \
		libfreetype6-dev \
		libldap2-dev \
		libjpeg62-turbo-dev \
		libmcrypt-dev \
		libpng-dev \
		libtidy-dev \
		libxslt-dev \
		zlib1g-dev \
		libicu-dev \
		g++ \
		default-mysql-client \
		nano \
		zip \
		unzip \
	--no-install-recommends && \
	rm -r /var/lib/apt/lists/*

# Install PHP Extensions
RUN docker-php-ext-configure intl && \
	docker-php-ext-configure mysqli --with-mysqli=mysqlnd && \
	docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ && \
	docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/ && \
	pecl install mcrypt-1.0.3 && \
	docker-php-ext-install -j$(nproc) \
		bcmath \
		gd \
		intl \
		ldap \
		mysqli \
		pdo \
		pdo_mysql \
		soap \
		tidy \
		xsl \
		&& docker-php-ext-enable gd

RUN curl -sS https://getcomposer.org/installer | php -- \
--install-dir=/usr/bin --filename=composer

CMD ["php-fpm"]