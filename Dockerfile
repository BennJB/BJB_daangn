FROM ruby:2.5-slim

LABEL Name=bjb_daangn Version=0.1.0
EXPOSE 5000

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /app
COPY . /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

CMD ["ruby", "bjb_daangn.rb"]
    