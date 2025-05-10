FROM python:3-alpine

RUN pip install --no-cache-dir crccheck pltable colorama

ARG ME_VERSION="master"
ARG DB_VERSION="heads/master"
ADD "https://github.com/platomav/MEAnalyzer.git#${ME_VERSION}" /opt/
ADD "https://raw.githubusercontent.com/platomav/MEAnalyzer/refs/${DB_VERSION}/MEA.dat" /opt/

RUN rm -f /opt/Changelog.txt /opt/README.md

ENTRYPOINT [ "python", "/opt/MEA.py" ]