# Yappa Apache Docker Image

## Usage

Add the following to your docker-compose.yml file:

```apache:
    image: yappabe/apache
    ports:
        - 80:80
    links:
        - php
    volumes_from:
        - app
    environment:
        DOCUMENT_ROOT: /var/www/app/html
```

## ENV vars

* DOCUMENT_ROOT defaults to /var/www/app/html