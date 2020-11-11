FROM python:3.7-alpine
# why?
# LABEL eddierosas

ENV PYTHONUNBUFFERED 1

RUN pip install pipenv

ENV PROJECT_DIR /usr/local/bin/src/webapp

WORKDIR ${PROJECT_DIR}

COPY Pipfile Pipfile.lock ${PROJECT_DIR}/

RUN pipenv install --system --deploy

RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser -D user
USER user