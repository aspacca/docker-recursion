FROM docker

RUN apk add --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ docker-compose
RUN addgroup -S recursion && adduser -S -D -h /home/recursion -G recursion recursion

USER recursion
ADD . /home/recursion/

WORKDIR /home/recursion
ENTRYPOINT docker-compose -H dind:2375 up