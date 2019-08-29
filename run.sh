#!/bin/bash

# To run
# Requires a unix terminal
# bash ./run.sh ...params

TD_ENV=development
TD_PORT=3000

td_check_args(){

  # Check for ENV override
  if [[ "$ENV" || "$RAILS_ENV" ]]; then
    TD_ENV=$ENV
  elif [[ "$RAILS_ENV" ]]; then
    TD_ENV=$RAILS_ENV
  fi

  # Check for port override
  if [[ "$PORT" ]]; then
    TD_PORT=PORT
  fi

}

# Start the server
# Example => bash ./run.sh
td_run_server(){
  RAILS_ENV=$TD_ENV bundle exec rails s  -p $TD_PORT
}

# Install the gems
# Example => bash ./run.sh bundle
td_run_bundler(){
    bundle install
}

# Setup the database
# Example => bash ./run.sh db
td_run_db_setup(){
    rails db:drop
    rails db:create
    rails db:migrate
    rails db:seed
}

# Run any tests
# Example => bash ./run.sh test
td_run_tests(){
    bundle exec rspec
}

# Format the code
# Example => bash ./run.sh format
td_run_format(){
  rubocop -a
}

# Run an action based on passed in param
td_run_action(){
  if [[ -z "$1" ]]; then
    # Default to just running the server
    td_run_server
  elif [[ "$1" == "bundle" ]]; then
    td_run_bundler
  elif [[ "$1" == "db" ]]; then
    td_run_db_setup
  elif [[ "$1" == "test" ]]; then
    td_run_tests
  elif [[ "$1" == "format" ]]; then
    td_run_format
  fi
}

td_run_action $@
