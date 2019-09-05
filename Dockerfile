FROM ruby:2.6.3-slim

RUN apt-get update -qq && apt-get install -y curl build-essential libpq-dev
RUN curl -sL https://deb.nodesource.com/setup_11.x  | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq
RUN apt-get -y install nodejs
RUN apt-get -y install yarn
RUN npm install

RUN mkdir /app
WORKDIR /app
ADD . /app

ENV BUNDLE_PATH=/bundle \
    BUNDLE_BIN=/bundle/bin \
    GEM_HOME=/bundle
ENV PATH="${BUNDLE_BIN}:${PATH}"

RUN gem install bundler:2.0.1
RUN bundle install
