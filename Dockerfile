FROM n8nio/n8n:latest
USER root
RUN apt-get update && apt-get install -y python3 python3-pip && \
    ln -sf /usr/bin/python3 /usr/bin/python
USER node
