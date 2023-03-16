#!/bin/sh

ulimit -n 65536
ulimit -s 819200

exec "$@"
