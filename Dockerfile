FROM docker:latest

ARG PUID=1000

RUN apk add --update --no-cache python py-pip python-dev bash && \
    pip install docker-compose && \
    adduser -D -u ${PUID} -G ping nonroot

USER nonroot
