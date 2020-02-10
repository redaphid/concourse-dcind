FROM alpine:3.11.3

ENV DOCKER_CHANNEL=stable \
    DOCKER_VERSION=19.03.5 \
    DOCKER_COMPOSE_VERSION=1.25.2

# Install Docker, Docker Compose, Docker Squash
RUN apk --update --no-cache add \
        docker \       
        bash \
        curl \
        device-mapper \
        py-pip \
        iptables \
        util-linux \
        ca-certificates \
        py-pip \
        python-dev \
        libffi-dev \
        openssl-dev \
        gcc \
        libc-dev \
        make \
        && \
    apk upgrade && \        
    pip install docker-compose==${DOCKER_COMPOSE_VERSION} && \    
    rm -rf /var/cache/apk/* && \
    rm -rf /root/.cache

COPY entrypoint.sh /bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
