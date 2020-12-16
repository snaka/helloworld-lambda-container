FROM amazon/aws-lambda-ruby:2.7
COPY app.rb Gemfile* ./
RUN bundle config set path 'vendor/bundle'
RUN bundle install
CMD [ "app.handler" ]
