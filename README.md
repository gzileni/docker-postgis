# POSTGIS Stack Docker

## Build Images

```bash
docker build -t <IMAGE> -f Dockerfile-base 
```

## Run Containers

This repository is useful for creating stack servers for Postgis with which to develop your own apps
To run this stack execute this command:

```bash
docker-compose up
```

## ENV

You first rename file *env.template* to **.env** and check your ENVIRONMENT variable.

## Import Shape Files

Read Documentation [here](./import/README.md).
