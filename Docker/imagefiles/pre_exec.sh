#!/usr/bin/env bash

# Start xvfb
Xvfb :99 -screen 0 1024x768x24 +extension GLX +render -noreset &
