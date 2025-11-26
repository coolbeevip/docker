FROM python:3.11-bookworm as builder

WORKDIR /usr/app
RUN python -m venv /usr/app/venv
ENV PATH="/usr/app/venv/bin:/root/.cargo/bin:$PATH"
ENV RUST_BACKTRACE=1
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
COPY --from=ghcr.io/astral-sh/uv:latest /uv /bin/uv
COPY requirements.txt .
COPY install.sh .
RUN bash install.sh
