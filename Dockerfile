FROM python:alpine
MAINTAINER Fábrica de Software Libre <libregob@fslibre.com>

# Basado en yajo/wdb-server

RUN apk add --no-cache --virtual .build-deps build-base python-dev linux-headers \
    && pip install wdb.server \
    && apk del .build-deps
CMD ["wdb.server.py", "--log_to_stderr"]
EXPOSE 1984 19840