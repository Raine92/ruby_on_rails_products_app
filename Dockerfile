FROM ruby:3.2

RUN apt-get update -qq && apt-get install -y nodejs sqlite3

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

EXPOSE 3000

ENV RAILS_ENV=development

CMD ["bash", "-c", "bin/rails db:prepare && bin/rails db:seed && bin/rails server -b 0.0.0.0 -p 3000"]
