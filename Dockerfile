FROM alpine
MAINTAINER Rafael Römhild <rafael@roemhild.de>

ENV VERSION 1.0.0rc4

# Install requirements
RUN apk add --update-cache \
        git \
        zlib \
        gnupg1 \
        py2-pip \
        openssl \
        py-jinja2 \
        py-libxml2 \
        py-libxslt \
        py-lxml \
        py-pbr \
        py-pillow \
        py-cffi \
        py-cryptography \
        ca-certificates

# Get Mailpile from github
RUN git clone https://github.com/mailpile/Mailpile.git \
        --branch $VERSION --single-branch --depth=1

WORKDIR /Mailpile

# Install missing requirements
RUN pip install -r requirements.txt

# Initial Mailpile setup
RUN ./mp setup

CMD ./mp --www=0.0.0.0:33411 --wait
EXPOSE 33411

VOLUME /root/.local/share/Mailpile
VOLUME /root/.gnupg
