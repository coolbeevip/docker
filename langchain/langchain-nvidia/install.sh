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
pip install --upgrade pip uv ruff mypy
pip install -r requirements.txt
