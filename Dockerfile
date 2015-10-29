FROM ruby:2.2.2
MAINTAINER Dia de Treinamento <contato@diadetreinamento.com.br>
RUN apt-get update -qq && apt-get install -y build-essential
RUN apt-get install -y nodejs libgmp3-dev libmysqlclient-dev

# Gems
RUN gem install bundler
RUN mkdir -p /usr/src/dia-de-treinamento/src
WORKDIR /usr/src/dia-de-treinamento/src
COPY Gemfile /usr/src/dia-de-treinamento/src/
COPY Gemfile.lock /usr/src/dia-de-treinamento/src/
RUN bundle install -V --without development test

# Src
COPY . /usr/src/dia-de-treinamento/src

# Cleanup
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Run
ENV RAILS_ENV=production
EXPOSE 3000
RUN rake assets:precompile
CMD rails server -b 0.0.0.0