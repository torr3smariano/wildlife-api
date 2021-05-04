FROM ruby:2.7.3
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /wildlife-api
COPY Gemfile /wildlife-api/Gemfile
COPY Gemfile.lock /wildlife-api/Gemfile.lock
RUN bundle install
# COPY ../compose /wildlife-api

# Add a script to be executed every time the container starts.
# COPY entrypoint.sh /usr/bin/
# RUN chmod +x /usr/bin/entrypoint.sh
#  ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]