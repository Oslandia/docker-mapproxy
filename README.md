# docker-mapproxy

A Dockerfile for [MapProxy](https://mapproxy.org).

MapProxy is run in [uWSGI](https://uwsgi-docs.readthedocs.io), which is configured to use the
"uwsgi" protocol on port 5000.

## Build image

```
docker build -t mapproxy .
```

## Run image

Run MapProxy with the test configuration:

```
docker run -it --name mapproxy -e PROCESSES=4 mapproxy
```

The `PROCESSES` environment variable is used to set the number of uWSGI worker processes.

Run MapProxy with a specific configuration file:

```
docker run -it --name mapproxy -v $(pwd)/mapproxy.yaml:/mapproxy/conf/mapproxy.yaml mapproxy
```

Publish the container's port (5000):

```
docker run -it --name mapproxy -p 8080:5000 mapproxy
```
