FROM ruby:3.0.0

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Set an environment variable where the Rails app is installed to inside of Docker image
ENV RAILS_ROOT /var/www/app
RUN mkdir -p $RAILS_ROOT

# Set working directory
WORKDIR $RAILS_ROOT

# Adding gems
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN gem install bundler && bundle install --jobs 20 --retry 5

# Adding project files
COPY . .

# Expose a volume so that nginx will be able to read in assets in production
VOLUME ["$RAILS_ROOT/public"]

# The default command that gets ran will be to start the Rails server
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
