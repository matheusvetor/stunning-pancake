FROM ruby:2.6.3-slim

RUN apt-get update -qq && apt-get install -y curl build-essential libpq-dev git zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

RUN curl -sL https://deb.nodesource.com/setup_11.x | bash -
RUN apt-get update -qq
RUN apt-get -y install nodejs

RUN mkdir /app
WORKDIR /app
ADD . /app

ENV BUNDLE_PATH=/bundle \
    BUNDLE_BIN=/bundle/bin \
    GEM_HOME=/bundle
ENV PATH="${BUNDLE_BIN}:${PATH}"

RUN gem install bundler:2.0.1
RUN bundle install
