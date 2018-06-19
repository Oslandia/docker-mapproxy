# docker-mapproxy

A Dockerfile for [MapProxy](https://mapproxy.org).

MapProxy is run in [uWSGI](https://uwsgi-docs.readthedocs.io), which is configured to use the
"uwsgi" protocol on port 5000. Thus, in most cases, you will want to use NGINX as a frontend. See
the [ngx_http_uwsgi_module](https://nginx.org/en/docs/http/ngx_http_uwsgi_module.html)
documentation.

## Build image

```
docker build -t mapproxy .
```

## Run image

Run MapProxy with the test configuration:

```
docker run -it --name mapproxy mapproxy
```

Run MapProxy with a specific MapProxy configuration file:

```
docker run -it --name mapproxy -v $(pwd)/mapproxy.yaml:/mapproxy/conf/mapproxy.yaml mapproxy
```

Publish the container's port (5000):

```
docker run -it --name mapproxy -p 8080:5000 mapproxy
```

Use a Docker volume for MapProxy's data cache:

```
docker run -it --name mapproxy -v mapproxy-cache:/mapproxy/cache_data
```

## Environment variables

A number of environment variables can be set to control the execution of uWSGI:

* `PROCESSES`: spawn the specified number of worker processes
* `UID`: `setuid` to the specified uid
* `GID`: `setgid` to the specified gid
