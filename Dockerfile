FROM n8nio/n8n:latest
USER root
RUN apk add --no-cache python3 py3-pip && \
    ln -sf /usr/bin/python3 /usr/bin/python
USER node
