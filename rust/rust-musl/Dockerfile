FROM alpine:3.21.2

RUN apk add --no-cache \
    build-base \
    wget \
    curl \
    libc-dev

# 安装 musl
RUN wget https://musl.libc.org/releases/musl-1.2.5.tar.gz && \
    tar -xzf musl-1.2.5.tar.gz && \
    cd musl-1.2.5 && \
    ./configure --prefix=/usr/local/musl && \
    make && \
    make install && \
    rm -rf musl-1.2.5 musl-1.2.5.tar.gz

# 创建 musl-g++
RUN ln -s /usr/bin/g++ /usr/bin/musl-g++

# 安装 Rust 和 Cargo
RUN curl -proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh -s -- -y

# 设置环境变量
ENV PATH="/root/.cargo/bin:${PATH}"

# 安装目标库
RUN rustup target add aarch64-unknown-linux-musl
RUN rustup target add x86_64-unknown-linux-musl

## 可选：安装特定版本的 Rust
#RUN rustup install stable
## 可选：设置默认的 Rust 版本
#RUN rustup default stable