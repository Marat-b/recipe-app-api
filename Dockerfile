FROM python:3.8-alpine

MAINTAINER marat-b

ENV PYTHONUNBUFFERED 1

# Install dependencies
COPY ./requirements.txt /requirements.txt
#EXPOSE 80
#RUN ping -c 10 127.0.0.1
RUN pip install  --trusted-host files.pythonhosted.org --trusted-host pypi.org --trusted-host pypi.python.org -r /requirements.txt


# Setup directory structure
RUN mkdir /app
WORKDIR /app
COPY ./app/ /app

RUN adduser -D user
USER user