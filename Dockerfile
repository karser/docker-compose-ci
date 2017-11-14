FROM docker:latest

ARG PUID=1000

RUN apk add --update --no-cache \
    bash \
    git \
    openssh-client \
    python \
    py-pip \
    python-dev \
    && rm -rf /var/cache/apk/* \
    && pip install docker-compose \
    && adduser -D -u ${PUID} -G ping -h /home/nonroot nonroot

USER nonroot
