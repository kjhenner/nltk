FROM debian:latest
MAINTAINER Kevin Henner <kjhenner@gmail.com>

RUN apt-get update
RUN apt-get install -y python python-pip python-dev build-essential gfortran libatlas-base-dev
RUN apt-get install -y python-tk

RUN pip install --upgrade pip
RUN pip install -U python-sql numpy scipy matplotlib scikit-learn nltk
