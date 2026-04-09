FROM node:22-bookworm-slim

# System tools Jerry needs
RUN apt-get update && apt-get install -y --no-install-recommends \
    openssh-client curl jq bash procps git ca-certificates socat \
    && rm -rf /var/lib/apt/lists/*

# Install OpenClaw + companion tools globally
RUN npm install -g openclaw@2026.2.6-3 clawhub@0.5.0 mcporter@0.7.3 2>/dev/null; exit 0

WORKDIR /root

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

HEALTHCHECK --interval=30s --timeout=5s --start-period=30s --retries=3 \
    CMD curl -sf http://127.0.0.1:18789/ || exit 1

ENTRYPOINT ["/entrypoint.sh"]
