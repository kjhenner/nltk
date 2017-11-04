Build the docker image defined by the Dockerfile in this repository:

    docker build -t nltk_env

Run the an interactive session on the container with the current working
directory mounted:

    docker run -ti --rm -v `pwd`:/app -v `pwd`/nltk_data:/root/nltk_data -w /app nltk_env bash

Run python:

    python

Import the `nltk` module:

    import nltk

Run the NLTK downloader tool:

    nltk.download()

Select the `Download` option with the `d` key, and enter to `book` package:

    Identifier>book
