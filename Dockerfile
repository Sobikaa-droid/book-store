FROM python:3.12-slim

ENV PYTHONUNBUFFERED 1

WORKDIR /dj-book-store/

COPY . .

COPY ./requirements.txt ./

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip \
    && pip install mysqlclient \
    && pip install -r requirements.txt
