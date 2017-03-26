#!/bin/bash

set -eux

pandoc "$1" -s -o "${1%.org}.md"
