# Mailpile Docker image

A minimal Mailpile Docker image based on Alpine Linux.

## Usage

```
docker run -d --name mailpile -p 33411:33411 rroemhild/mailpile
```

Bind volume `/root/.local/share/Mailpile` for persistent storage.
