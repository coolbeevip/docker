#!/bin/bash

init_kdc_path() {
  if [ ! -d "/kdc/kerby-data" ]; then
    cp -r /tmp/kerby-data/ /kdc/kerby-data/
  fi
}

exec "$@"