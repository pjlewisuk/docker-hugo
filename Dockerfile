FROM alpine:latest

MAINTAINER Paul Lewis (github@pjlewis.org)

RUN apk add --no-cache \
    curl \
    git \
    openssh-client \
    rsync

# Default version, for use with local `docker build` commands
# This will be overridden by $VERSION from `hooks/build` when
# the image is built by Docker Autobuild
ARG VERSION='0.72.0'

RUN mkdir -p /usr/local/src \
    && cd /usr/local/src \

    && curl -L https://github.com/gohugoio/hugo/releases/download/v${VERSION}/hugo_${VERSION}_linux-64bit.tar.gz | tar -xz \
    && mv hugo /usr/local/bin/hugo \

    && curl -L https://bin.equinox.io/c/dhgbqpS8Bvy/minify-stable-linux-amd64.tgz | tar -xz \
    && mv minify /usr/local/bin/ \

    && addgroup -Sg 1000 hugo \
    && adduser -SG hugo -u 1000 -h /src hugo

WORKDIR /src

EXPOSE 1313
