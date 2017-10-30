FROM docker:latest

RUN curl -s -L https://github.com/docker/compose/releases/latest | \
    egrep -o '/docker/compose/releases/download/[0-9.]*/docker-compose-Linux-x86_64' | \
    wget --base=http://github.com/ -i - -O /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose && \
    /usr/local/bin/docker-compose --version

ARG PUID=1000
ARG PGID=1000

RUN addgroup -g ${PGID} nonroot && \
    adduser -D -u ${PUID} -G nonroot nonroot

USER nonroot
