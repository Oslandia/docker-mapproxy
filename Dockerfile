FROM debian:stretch-slim

RUN apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y \
        build-essential \
        libgdal-dev \
        libgeos-dev \
        libjpeg-dev \
        libproj12 \
        python3-dev \
        python3-pip \
        python3-setuptools \
        python3-wheel \
        python3-yaml \
        zlib1g-dev \
    && pip3 install \
        MapProxy \
        Pillow \
        Shapely \
        uwsgi \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m mapproxy

ENV TINI_VERSION v0.17.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini

COPY --chown=mapproxy:mapproxy cmd.sh uwsgi.yml mapproxy-app.py /home/mapproxy/

USER mapproxy
WORKDIR /home/mapproxy

ENTRYPOINT ["/tini", "--"]

CMD ["/home/mapproxy/cmd.sh"]
