FROM docker:latest

ARG COMPOSE_VERSION="1.17.0-rc1"
ARG PUID=1000

RUN apk --no-cache --update add curl bash && \
    curl -L https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose && \
    adduser -D -u ${PUID} -G ping nonroot

USER nonroot
