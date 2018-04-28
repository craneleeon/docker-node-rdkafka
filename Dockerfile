FROM node:8.11.1-alpine

RUN apk --no-cache add \
      bash \
      g++ \
      ca-certificates \
      lz4-dev \
      musl-dev \
      cyrus-sasl-dev \
      openssl-dev \
      make \
      python

RUN apk add --no-cache --virtual .build-deps gcc zlib-dev libc-dev bsd-compat-headers py-setuptools bash

VOLUME "/logs" 
VOLUME "/app"
WORKDIR "/app"

# Install node-rdkafka
RUN npm install -g node-rdkafka
# Copy package.json first to check if an npm install is needed

