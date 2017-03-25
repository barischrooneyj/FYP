#!/bin/bash

set -eux

pan () { for f in slides/*.org; do pandoc "$f" -s -o "${f%.org}.md"; done }

pan
when-changed slides/*.org pan &
npm start
