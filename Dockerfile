FROM python:3.7.1-alpine3.8

LABEL "com.github.actions.name"="DigitalOcean Spaces Sync"
LABEL "com.github.actions.description"="Sync assets to repository-specific directory within space, maintaining local directory structure"

LABEL maintainer="Galileo Daras <galileo@getcoffee.io>"
LABEL version="1.0"
LABEL repository="https://github.com/nebula-dev/spaces-sync-action"
LABEL homepage="https://nebula.dev/"

RUN apk update
RUN apk add tar sed ca-certificates
RUN pip install python-dateutil

# https://www.pathname.com/fhs/pub/fhs-2.3.html#OPTADDONAPPLICATIONSOFTWAREPACKAGES
ADD https://github.com/s3tools/s3cmd/releases/download/v2.1.0/s3cmd-2.1.0.tar.gz /opt/
RUN tar xzf /opt/s3cmd-2.1.0.tar.gz -C /opt/ && ln -s /opt/s3cmd-2.1.0/s3cmd /usr/bin/s3cmd

ADD s3cfg.temp /root/.s3cfg.temp

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
