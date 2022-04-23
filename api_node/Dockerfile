FROM python:3.7-alpine

USER root

RUN apk add --no-cache make git bash

# cryptography: https://cryptography.io/en/latest/installation/#alpine
RUN apk add --no-cache gcc musl-dev python3-dev libffi-dev openssl-dev

# https://stackoverflow.com/a/57485724
RUN apk add --update --no-cache py3-numpy py3-scipy py3-pillow
ENV PYTHONPATH "$PYTHONPATH:/usr/lib/python3.7/site-packages"

# golang
RUN apk add --no-cache go

# aea installation
RUN pip install --upgrade pip
RUN pip install --upgrade --force-reinstall open-aea[all]==1.6.0

# directories and aea cli config
WORKDIR /home/agents
RUN pip install --upgrade setuptools
# aea build script
COPY /build.sh /build.sh
RUN ["chmod", "+x", "/build.sh"]
COPY . .
RUN bash /build.sh
ENTRYPOINT [ "/home/agents/agent/run.sh" ]
