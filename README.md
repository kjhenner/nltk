Build the docker image defined by the Dockerfile in this repository:

    docker build -t nltk_env

Create a local data direcotry:

    mkdir nltk_data

Run the an interactive session on the container with the current working
directory mounted:

    docker run -ti --rm -v `pwd`:/app -w /app nltk_env bash

Run python:

    python

Import the `nltk` module:

    import nltk

Run the NLTK downloader tool:

    nltk.download()

Select the *Config* option with the `c` key, then *Set Data Dir* with the `d`
key. Enter the name of the local data directory you created above:

    New Directory>./nltk_data

Use the `m` key to return to the main configuration menu. Select the `Download`
option with the `d` key, and enter to `book` package:

    Identifier>book
