#!/bin/bash

set -e

# Install Rust
apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    cmake \
    clang \
    libclang-dev \
    llvm-dev
curl https://sh.rustup.rs -sSf | sh -s -- -y

# Install Requirements
platform=$(uname -m)
echo "platform: $platform"
pip install --upgrade pip uv ruff mypy
if [[ "$platform" == "x86_64" ]]; then
  pip install torch==2.0.1+cpu torchvision==0.15.2+cpu --default-timeout=600 -f https://download.pytorch.org/whl/torch_stable.html
fi
pip install -r requirements.txt
