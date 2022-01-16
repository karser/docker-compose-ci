# docker-compose-ci
CI image which includes docker-compose that running on behalf of non-root user

### build
```
# latest is 19.03
export DOCKER_VERSION=19.03
export DOCKER_VERSION=20.10

docker build -t docker-compose-ci \
    --build-arg DOCKER_VERSION=${DOCKER_VERSION} \
    --tag karser/docker-compose-ci:latest \
    --tag karser/docker-compose-ci:$DOCKER_VERSION .

docker push karser/docker-compose-ci:$DOCKER_VERSION; \
docker push karser/docker-compose-ci:latest
```
