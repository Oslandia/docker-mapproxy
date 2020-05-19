# Stack for MapProxy and QGis

This is a demo stack (with docker-compose) to have a QGis Server behind a MapProxy.

## Images

This stack use 3 images: 
* mapproxy from [Oslandia](http://github.com/oslandia/docker-mapproxy). 
* qgis-exec from [Oslandia](http://github.com/oslandia/docker-qgis). As default image, you should the build the one based on official QGis image as described in the [README.md](https://github.com/Oslandia/docker-qgis/tree/master/qgis-exec#build-the-image). 
* nginx version 1.13

As QGis has no web server, we set the nginx to provide a http point usable by mapproxy. Nginx is also used to expose mapproxy services.

## Configuration

Sample configuration files for mapproxy (**mapproxy.yaml** and **seed.yaml**) are provided. As for Nginx.

Default QGis project is in the **data** directory: **layers.qgs**.

## Run

Start the stack:

```bash
docker-compose up
```

If `docker-compose` is not available on your system you can install it using in a Python
virtual environment:

```bash
virtualenv venv
(venv) $ pip install docker-compose
```

When the stack is up you can open http://localhost:8080/mapproxy/demo in your browser. You should see an OpenLayers map connected to the osm.qgs QGIS project used as an example.

Stop the stack:

```bash
docker-compose rm -sf
```
