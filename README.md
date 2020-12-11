# Mailpile Docker image

A minimal Mailpile Docker image based on Alpine Linux.

## Usage

```
docker run -d --name mailpile -p 33411:33411 rroemhild/mailpile
```

Bind volume `/root/.local/share/Mailpile` and `/root/.gnupg` for persistent storage:

```
docker run -d --name mailpile -p 33411:33411 -v /some/local/path:/root/.local/share/Mailpile -v /another/local/path:/root/.gnupg rroemhild/mailpile
```
## Docker-compose

```yaml
version: '3'
services:
  mailpile:
    container_name: mailpile
    image: rroemhild/mailpile
    volumes:
      - '/some/local/path:/root/.local/share/Mailpile'
      - '/another/local/path:/root/.gnupg'
    ports:
      - '33411:33411'
```
