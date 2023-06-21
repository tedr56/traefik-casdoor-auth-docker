FROM golang:alpine AS build

RUN apk add --no-cache git

RUN addgroup -S webhook && adduser -S -u 10000 -g webhook webhook

WORKDIR /src

RUN git clone https://github.com/casdoor/traefik-casdoor-auth.git

WORKDIR /src/traefik-casdoor-auth

CMD go run cmd/webhook/main.go -configFile="conf/plugin.json"

EXPOSE 9999


