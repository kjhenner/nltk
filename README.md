## Basic Docker Setup

Install and launch [Docker for Mac](https://www.docker.com/docker-mac)

From this directory, build the docker image defined by this repository's
Dockerfile:

    docker build -t nltk_env .

Run the following command to begin an interactive session on the container.
This will mount the repository directory as `/app` on the container, and mount
`./nltk_data` in this directory to the default location in NLTK's data path:
`/root/nltk_data`.

    docker run -it \
      --rm \ 
      -v `pwd`:/app \
      -v `pwd`/nltk_data:/root/nltk_data \
      -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
      -e DISPLAY=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}'):0 \
      -w /app \
      nltk_env bash

Run python:

    python

## Configure GUI

Some features of NLTK such as the download menu and plots use a GUI.

Some configuration is required to get your container to pass these display
functions to an X11 server on your host.

Install [XQuartz](https://www.xquartz.org/). When the installation completes,
it will prompt you to log out and log back in to make XQuartz your default X11
server. Do this before continuing.

Launch the XQuartz application and go to the *Preferences* menu. Under the
*Security* tab, click the checkbox to allow connections from network clients.
Quit and relaunch XQuarts to allow this change to take effect.

Use `ifconfig` to get your host IP address.

    ifconfig en0 | grep inet | awk '$1=="inet" {print $2}'

Run the following command to ensure localhost is allowed X11 forwarding.
Replace `<IPADDRESS>` with the IP address returned by the previous command.

    xhost + <IPADDRESS>

Your container should now be able to access your host system's X11 server to
support its GUI.
