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
```
