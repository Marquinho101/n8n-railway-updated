FROM node:lts-alpine AS python-stage
RUN apk add --no-cache python3 py3-pip && \
    python3 -m venv /opt/python-runner && \
    /opt/python-runner/bin/pip install --upgrade pip && \
    /opt/python-runner/bin/pip install n8n-task-runners

FROM n8nio/n8n:latest
USER root
COPY --from=python-stage /usr/bin/python3* /usr/bin/
COPY --from=python-stage /usr/lib/python3* /usr/lib/
COPY --from=python-stage /usr/lib/libpython3* /usr/lib/
COPY --from=python-stage /opt/python-runner /opt/python-runner
RUN ln -sf /usr/bin/python3 /usr/bin/python
ENV N8N_RUNNERS_PYTHON_PATH=/opt/python-runner
