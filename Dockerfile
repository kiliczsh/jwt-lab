FROM ruby:3.1.3

RUN apt-get update -qq && apt-get install -y nodejs npm python2
RUN node -v
RUN npm -v
ENV INSTALL_PATH /myapp
RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
COPY . .
RUN bundle install
RUN npm install
RUN rails db:migrate
CMD ["rails", "server"]
