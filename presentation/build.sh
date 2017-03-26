#!/bin/bash

set -eux

# Build each given org file.
for f in "$@"; do
    ./pan.sh "$f"
done
