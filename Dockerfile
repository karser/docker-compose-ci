FROM docker:latest

RUN apk add --update python py-pip python-dev bash && pip install docker-compose

ARG PUID=1000
ARG PGID=1000

RUN addgroup -g ${PGID} nonroot && \
    adduser -D -u ${PUID} -G nonroot nonroot

USER nonroot
