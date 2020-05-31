FROM python:3.8-slim

EXPOSE 8181

WORKDIR /

COPY botamusique /botamusique

WORKDIR /botamusique

RUN python3 -m venv venv
RUN venv/bin/pip install wheel
RUN venv/bin/pip install -r pymumble/requirements.txt
RUN venv/bin/pip install -r requirements.txt


RUN apt update && apt install -y \
    opus-tools \
    ffmpeg \
    libmagic-dev  \
    curl

ENTRYPOINT ["venv/bin/python","mumbleBot.py","--config", "/config/configuration.ini"]