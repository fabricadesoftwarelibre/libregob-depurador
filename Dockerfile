FROM debian:jessie-slim
MAINTAINER  Fábrica de Software Libre <libregob@fslibre.com>

# Dockerfile base desarrollado por el usuario arkhan del sitio notabug.org
RUN apt-get update && \
    apt-get install -y python-dev curl gcc && \
    rm -rf /var/lib/apt/lists/* && \
    curl -sL https://bootstrap.pypa.io/get-pip.py >> /tmp/get-pip.py && \
    python /tmp/get-pip.py && \
    rm -rf /tmp/get-pip.py

# WDB debugger
RUN /usr/local/bin/pip install --no-cache-dir wdb.server

EXPOSE 1984 19840

CMD wdb.server.py --log_to_stderr

