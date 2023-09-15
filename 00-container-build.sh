#/bin/sh

docker build . -t sparsick/spring-boot-demo:latest
docker run sparsick/spring-boot-demo:latest
