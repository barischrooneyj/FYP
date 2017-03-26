#!/bin/bash

set -eux

pan () { pandoc "$1" -s -o "${1%.org}.md"; }

# For each org slide:
#  - create markdown
#  - create markdown on file change
for f in slides/*.org; do
    pan "$f" 
    when-changed "$f" pan "$f" &
done

# Kill all spawned processes (file watchers) on exit.
trap "kill -- -$$" SIGINT SIGTERM EXIT

# Start revealJS server.
npm start
