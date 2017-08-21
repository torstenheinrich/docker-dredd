FROM alpine

LABEL maintainer="t.heinrich@live.de"
LABEL version="4.3.0"

# install all the dependencies
RUN apk add --update \
    nodejs \
    nodejs-npm \
    python \
    make \
    g++ \
    git

# install dredd
RUN npm install -g dredd@4.3.0

# remove all the unnecessary packages again
RUN apk del \
    python \
    make \
    g++ \
    git \
  && rm -rf /var/cache/apk/*

WORKDIR /docs

ENTRYPOINT ["dredd"]
