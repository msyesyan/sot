#!/bin/bash
# reference by http://effectif.com/ruby/automating-bundle-exec

BUNDLED_COMMANDS="${BUNDLED_COMMANDS:-cap capify cucumber heroku cap rackup rails rake rspec ruby shotgun spec spork thin unicorn unicorn_rails}"

## Functions

bundler-installed()
{
    which bundle > /dev/null 2>&1
}

within-bundled-project()
{
    local dir="$(pwd)"
    while [ "$(dirname $dir)" != "/" ]; do
        [ -f "$dir/Gemfile" ] && return
        dir="$(dirname $dir)"
    done
    false
}

run-with-bundler()
{
    if bundler-installed && within-bundled-project; then
        bundle exec $@
    else
        $@
    fi
}

## Main program

for CMD in $BUNDLED_COMMANDS; do
    alias $CMD="run-with-bundler $CMD"
done
