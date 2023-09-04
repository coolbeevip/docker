FROM python:3.9-buster as builder

WORKDIR /usr/app
RUN python -m venv /usr/app/venv
ENV PATH="/usr/app/venv/bin:$PATH"
COPY requirements.txt .
# CPU Only
RUN uname -m
RUN pip install torch==2.0.1+cpu torchvision==0.15.2+cpu --default-timeout=600 -f https://download.pytorch.org/whl/torch_stable.html
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
