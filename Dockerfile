FROM alpine
MAINTAINER Rafael Römhild <rafael@roemhild.de>

ENV VERSION 0.4.2

# Install requirements
RUN apk add --update-cache \
        git \
        zlib \
        gnupg \
        py-pip \
        openssl \
        py-jinja2 \
        py-libxml2 \
        py-libxslt

# Install py-lxml from testing repo
RUN apk add --update-cache \
        --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ py-lxml

# Get Mailpile from github
RUN git clone https://github.com/mailpile/Mailpile.git \
        --branch $VERSION --single-branch --depth=1

WORKDIR /Mailpile

# Install missing requirements
RUN pip install -r requirements.txt

# Initial Mailpile setup
RUN ./mp setup

EXPOSE 33411
VOLUME /root/.local/share/Mailpile

CMD ./mp --www=0.0.0.0:33411 --wait
