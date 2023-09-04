#!/bin/bash

set -e

platform=$(uname -m)
echo "platform: $platform"
pip install --upgrade pip
if [[ "$platform" == "x86_64" ]]; then
  pip install torch==2.0.1+cpu torchvision==0.15.2+cpu --default-timeout=600 -f https://download.pytorch.org/whl/torch_stable.html
fi
pip install -r requirements.txt
