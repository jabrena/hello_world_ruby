FROM ruby:3.4.2-slim

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

EXPOSE 8080

CMD ["ruby", "server.rb"]
