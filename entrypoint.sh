#!/bin/sh
set -e
PORT="${PORT:-10000}"
if [ -z "$UUID" ]; then
  UUID="$(cat /proc/sys/kernel/random/uuid)"
  echo "UUID not set, generated: $UUID"
fi
sed -i "s/__PORT__/${PORT}/g; s/__UUID__/${UUID}/g" /etc/xray/config.json
echo "Starting xray on port ${PORT}"
exec xray run -config /etc/xray/config.json
