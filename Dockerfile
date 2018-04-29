FROM node:8.11.1-alpine

RUN apk add --no-cache \
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

RUN mkdir -p /.npm-global
ENV NPM_CONFIG_PREFIX=/.npm-global 
ENV PATH=$PATH:/.npm-global/bin
ENV NODE_PATH=$NODE_PATH:/.npm-global/lib/node_modules

VOLUME "/logs" 
VOLUME "/app"
WORKDIR "/app"

# Install node-rdkafka
RUN npm install -g --unsafe-perm node-rdkafka
# Copy package.json first to check if an npm install is needed
RUN apk del .build-deps


