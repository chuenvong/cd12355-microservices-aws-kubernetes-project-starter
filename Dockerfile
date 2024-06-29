FROM python:3.10-slim-buster

USER root

ARG DB_USERNAME=$DB_USERNAME
ARG DB_PASSWORD=$DB_PASSWORD

WORKDIR /src

COPY ./analytics/requirements.txt requirements.txt

RUN apt update -y && apt install -y build-essential libpq-dev

RUN pip install -r requirements.txt

COPY ./analytics .

CMD python app.py