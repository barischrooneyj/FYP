#!/bin/bash

set -eux

# Convert from org to markdown.
pandoc "$1" -s -o "${1%.org}.md"
