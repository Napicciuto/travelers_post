#!/usr/bin/env bash

# this script is executed once the web container started
echo "running start_services.sh in RACK_ENV=$RAILS_ENV"
echo "assets"
if [ "$RAILS_ENV" = "staging" ] || [ "$RAILS_ENV" = "production" ]; then
    bundle exec rake assets:precompile
    echo "precompiled"
else
    rm -rf public/assets
    echo "not precompiled"
fi

bundle exec thin start

