FROM ruby:2.7.5

RUN apt-get update -qq && \
    apt-get install -y build-essential \
                       libpq-dev \
                       nodejs \
                       default-mysql-client \
                       yarn

#RUN APP_ROOT /portfolio_1
WORKDIR /portfolio_1

COPY Gemfile /portfolio_1/Gemfile
COPY Gemfile.lock /portfolio_1/Gemfile.lock

RUN bundle install
ADD . /portfolio_1