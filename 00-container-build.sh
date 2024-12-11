#/bin/sh

docker build . -t sparsick/spring-boot-demo:latest
docker run -p 8080:8080 sparsick/spring-boot-demo:latest
