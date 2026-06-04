FROM node:lts-alpine AS python-stage
RUN apk add --no-cache python3

FROM n8nio/n8n:latest
USER root
COPY --from=python-stage /usr/bin/python3* /usr/bin/
COPY --from=python-stage /usr/lib/python3* /usr/lib/
COPY --from=python-stage /usr/lib/libpython3* /usr/lib/
RUN ln -sf /usr/bin/python3 /usr/bin/python
USER node
