#!/bin/bash

set -eux

# Build slides.
./build.sh "$@"

# Build slides on file change.
for f in "$@"; do
    when-changed "$f" ./pan.sh "$f" &
done

# Kill all child processes (file watchers) on exit.
trap "kill -- -$$" SIGINT SIGTERM EXIT

# Start revealJS server.
npm start
