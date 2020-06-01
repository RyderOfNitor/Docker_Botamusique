FROM python:3.8-slim

EXPOSE 8181

RUN apt update && apt install -y \
    opus-tools \
    ffmpeg \
    libmagic-dev  \
    curl \
    tar

WORKDIR /

RUN curl -Lo botamusique.tar.gz http://packages.azlux.fr/botamusique/sources.tar.gz
RUN tar -xzf botamusique.tar.gz
RUN rm botamusique.tar.gz

WORKDIR /botamusique

RUN python3 -m venv venv
RUN venv/bin/pip install wheel
RUN venv/bin/pip install -r requirements.txt

ENTRYPOINT ["venv/bin/python","mumbleBot.py","--config", "/config/configuration.ini"]