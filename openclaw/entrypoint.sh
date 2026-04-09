#!/bin/bash
set -e

# Create symlinks for host scripts that Jerry's skills reference
ln -sf /root/clawd/skills/retell-voice/call.sh /usr/local/bin/retell-call 2>/dev/null || true
ln -sf /root/clawd/skills/social-poster/post.sh /usr/local/bin/social-post 2>/dev/null || true
ln -sf /root/clawd/skills/social-poster/stats.sh /usr/local/bin/social-stats 2>/dev/null || true
ln -sf /root/clawd/skills/infra-ops/kb.sh /usr/local/bin/kb 2>/dev/null || true
ln -sf /root/clawd/skills/infra-ops/journal.sh /usr/local/bin/journal 2>/dev/null || true

# Ensure memory directory exists
mkdir -p /root/clawd/memory

exec openclaw gateway --port 18789
