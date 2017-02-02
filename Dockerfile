FROM ruby:2.4.0-alpine

# Update Bundler
RUN gem install bundler

# Cache dependencies
COPY ["Gemfile", "Gemfile.lock", "*.gemspec", "/tmp/cache/"]
WORKDIR /tmp/cache
RUN bundle install --without development && rm -rf /tmp/cache

# Copy code
COPY . /root/app/
WORKDIR /root/app

# Registers bundle in working directory
RUN bundle install --without development

# Expose server port
EXPOSE 5000

# Start server & tail logs in order to sustain foreground process
CMD trap exit TERM; bundle exec rake stub_server:start && tail -f tmp/log/stub_server_console.log
