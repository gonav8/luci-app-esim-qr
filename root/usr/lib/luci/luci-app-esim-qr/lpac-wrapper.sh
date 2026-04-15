#!/bin/sh
# Wrapper for lpac to handle AT device and return JSON
LPAC_APDU=at AT_DEVICE=/dev/ttyUSB2 lpac "$@"
