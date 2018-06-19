FROM debian:stretch-slim

RUN apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y \
        build-essential \
        libgdal20 \
        libgdal-dev \
        libgeos-3.5.1 \
        libgeos-c1v5 \
        libgeos-dev \
        libjpeg-dev \
        libproj12 \
        libpython3.5 \
        python3-dev \
        python3-pip \
        python3-setuptools \
        python3-wheel \
        python3-yaml \
        zlib1g \
        zlib1g-dev \
    && pip3 install \
        MapProxy \
        Pillow \
        Shapely \
        uwsgi \
    && apt-get purge -y --auto-remove \
        build-essential \
        libgdal-dev \
        libgeos-dev \
        libjpeg-dev \
        python3-dev \
        python3-pip \
        python3-wheel \
        zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

ENV TINI_VERSION v0.17.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini

RUN mkdir /mapproxy

COPY --chown=mapproxy:mapproxy cmd.sh uwsgi.yml mapproxy-app.py /mapproxy/

ENTRYPOINT ["/tini", "--"]

CMD ["/mapproxy/cmd.sh"]
