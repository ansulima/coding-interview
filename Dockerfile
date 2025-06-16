FROM ruby:3.2.2

RUN apt-get update -qq && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    libpq-dev \
    nodejs
WORKDIR /coding-interview
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .
EXPOSE 3000
CMD ["rails", "s", "-p", "3000", "-b", "0.0.0.0"]
