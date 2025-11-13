FROM ruby:3.2

# Asennetaan riippuvuudet
RUN apt-get update -qq && apt-get install -y nodejs sqlite3

WORKDIR /app

# Kopioidaan gemit ja asennetaan
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Kopioidaan koko projekti
COPY . .

# Expondoidaan portti
EXPOSE 3000

# Käynnistetään Rails development-tilassa ja ajetaan migraatiot automaattisesti
CMD ["bash", "-c", "bin/rails db:prepare && bin/rails server -b 0.0.0.0 -p 3000"]
