# Use Ruby 3.2.1 slim as the base image
FROM ruby:3.2.1-slim

# Set the working directory inside the container
WORKDIR /rails

# Install necessary dependencies
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  yarn \
  && rm -rf /var/lib/apt/lists/*

# Copy Gemfile and Gemfile.lock, then install gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy the rest of the application code
COPY . .

# Expose port 3000 for the Rails server
EXPOSE 3000

# Set the default command
CMD ["bash", "-c", "rm -f tmp/pids/server.pid && bin/rails server -b 0.0.0.0"]
