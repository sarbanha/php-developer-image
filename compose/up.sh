#!/usr/bin/env bash
podman-compose -p 80 up -d 2>&1 > /dev/null || echo "Failed to start container"
