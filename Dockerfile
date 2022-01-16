ARG DOCKER_VERSION=latest
FROM docker:$DOCKER_VERSION

ARG PUID=1000
ARG DOCKER_MACHINE_VERSION=v0.16.2
ARG DOCKER_COMPOSE_VERSION=1.26.2

RUN apk --no-cache add \
        bash \
        curl \
        jq \
        git \
        make \
        openssh-client \
        python3 \
        py-pip \
        py-paramiko \
        python3-dev \
        rsync \
        subversion \
    \
    && pip install --quiet \
        docker-compose==${DOCKER_COMPOSE_VERSION} \
        awscli \
    \
    && curl -sL https://github.com/docker/machine/releases/download/${DOCKER_MACHINE_VERSION}/docker-machine-`uname -s`-`uname -m` -o /usr/local/bin/docker-machine \
    && chmod +x /usr/local/bin/docker-machine \
    \
    && adduser -D -u ${PUID} -G ping -h /home/nonroot nonroot \
    \
    && docker --version \
    && docker-machine --version \
    && docker-compose --version \
    && aws --version

RUN apk --update add ca-certificates

RUN apk --no-cache --update add \
        php7 \
        php7-amqp \
        php7-apcu \
        php7-bcmath \
        php7-dom \
        php7-ctype \
        php7-curl \
        php7-gd \
        php7-gmp \
        php7-fileinfo \
        php7-iconv \
        php7-imagick \
        php7-intl \
        php7-json \
        php7-mbstring \
        php7-msgpack \
        php7-opcache \
        php7-openssl \
        php7-pdo \
        php7-phar \
        php7-phpdbg \
        php7-session \
        php7-simplexml \
        php7-soap \
        php7-sysvsem \
        php7-tokenizer \
        php7-xml \
        php7-xmlreader \
        php7-xmlwriter \
        php7-zip \
        php7-zlib \
    && php -v

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN apk --no-cache --update add nodejs npm \
    && node -v && npm -v

USER nonroot
