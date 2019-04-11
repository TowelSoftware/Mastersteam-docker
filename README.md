# Mastersteam-docker


Docker wrapper for my Steam Master Server search go web service \
https://github.com/TowelSoftware/Mastersteam

# Requirements

Docker must be installed. That's it. You do not need to have Go installed.

# Usage and Demo

**Step 1:** Create the Docker image according to [Dockerfile](Dockerfile).

```shell
# This may take a few minutes.
$ docker build -t twlsw/mastersteam:latest .
```

**Step 2:** Start a container for the Docker image.

```shell
$ docker run -p 8080:8080 twlsw/mastersteam:latest
```

**Step 3:** Open another terminal and access the example API endpoint.

```shell
$ curl "http://localhost:8080/search/[APP_ID]/[NAME]"
$ curl "http://localhost:8080/server/[IP]"
```