#!/usr/bin/env bash
podman-compose -p 80 down 2>&1 > /dev/null || echo "Failed to stop container"
