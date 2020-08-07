FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /simple_note
WORKDIR /simple_note
COPY Gemfile /simple_note/Gemfile
COPY Gemfile.lock /simple_note/Gemfile.lock
RUN bundle install
COPY . /simple_note

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
