FROM ruby:3.2.2

ENV RAILS_ENV=development
ENV DATABASE_HOST=postgresql
ENV DATABASE_USERNAME=postgres
ENV DATABASE_PASSWORD=bogressuti

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

WORKDIR /myapp

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

EXPOSE 3000

CMD ["rails", "server"]
