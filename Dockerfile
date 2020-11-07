FROM ruby:2.3.3-slim

RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak && \
       echo "deb http://mirrors.163.com/debian/ jessie main non-free contrib" >/etc/apt/sources.list && \
       echo "deb http://mirrors.163.com/debian/ jessie-proposed-updates main non-free contrib" >>/etc/apt/sources.list && \
       echo "deb-src http://mirrors.163.com/debian/ jessie main non-free contrib" >>/etc/apt/sources.list && \
       echo "deb-src http://mirrors.163.com/debian/ jessie-proposed-updates main non-free contrib" >>/etc/apt/sources.list

RUN apt-get update -qq && apt-get install -y build-essential

RUN apt-get install -y libpq-dev

RUN apt-get install -y libsqlite3-dev

RUN apt-get install -y nodejs

RUN apt-get install -y imagemagick

RUN apt-get install -y vim

ENV RAILS_ROOT /var/www/eshop

RUN mkdir -p $RAILS_ROOT/tmp/pids

WORKDIR $RAILS_ROOT

COPY Gemfile Gemfile

COPY Gemfile.lock Gemfile.lock

RUN gem install bundler
RUN bundle install

COPY . .

RUN bundle exec rake RAILS_ENV=$RAILS_ENV DATABASE_URL=postgresql://$POSTGRES_USER:$POSTGRES_PASSWORD@127.0.0.1/$POSTGRES_PRODUCT_DB assets:precompile

CMD ["config/containers/app_cmd.sh"]