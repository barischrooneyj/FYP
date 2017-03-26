#!/bin/bash

set -eux

for f in "$@"; do
    ./pan.sh "$f"
done
