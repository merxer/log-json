FROM golang:alpine AS build
ADD . /src
RUN cd /src && \
    apk add git && \
    go get -v github.com/labstack/echo && \
    go get -v github.com/labstack/echo/middleware && \
    go build -o server

FROM alpine
LABEL version="1.0.0" maintainer="THAWATCHAI SINGNGAM <merxer.io@gmail.com>"
WORKDIR /app
COPY --from=build /src/server /app/
ENTRYPOINT ./server
