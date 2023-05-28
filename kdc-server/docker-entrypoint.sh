#!/bin/bash

init_kdc_path() {
  if [ ! -d "/kdc/kerby-data" ]; then
    mkdir -p /kdc
    cp -r /tmp/kerby-data/ /kdc/kerby-data/
  fi
}

init_kdc_path

exec "$@"