FROM ruby:2.0

RUN apt-get update && apt-get install -y \
	nodejs \
	sqlite3 \
	ca-certificates \
	--no-install-recommends && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/
RUN bundle install

ADD . /usr/src/app

RUN chmod 744 deploy/start_services.sh

EXPOSE 3000

CMD deploy/start_services.sh

