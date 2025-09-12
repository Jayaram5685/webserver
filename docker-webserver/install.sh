#!/bin/bash

echo " Setting up Dockerized Web Servers...***"

# This script is cross-platform (macOS/Linux):
# - Verifies Docker CLI is installed
# - Waits for the Docker engine to be ready
# - Detects Docker Compose v2 plugin (docker compose) or legacy (docker-compose)
# - Builds and starts the stack with the correct compose command

# Require docker CLI and wait for daemon regardless of OS
if ! command -v docker >/dev/null 2>&1; then
  echo "Docker CLI not found. Please install Docker Desktop (macOS) or Docker Engine (Linux) and try again."
  exit 1
fi

echo "Waiting for Docker engine to be ready..."
i=0
until docker info >/dev/null 2>&1; do
  ((i++))
  if [[ $i -gt 30 ]]; then
    echo "Docker engine did not become ready. Please ensure Docker is running and try again."
    exit 1
  fi
  sleep 2
done

# Detect compose command: prefer v2 (docker compose), fallback to legacy docker-compose
COMPOSE_CMD="docker compose"
if ! $COMPOSE_CMD version >/dev/null 2>&1; then
  if command -v docker-compose >/dev/null 2>&1; then
    COMPOSE_CMD="docker-compose"
  else
    echo "Docker Compose not found. Install the Compose plugin (preferred) or docker-compose and retry."
    exit 1
  fi
fi

# Build & Start services
echo "📦 Building and starting containers..."
$COMPOSE_CMD up -d --build

echo "✅ Setup complete!"
echo "🌐 Nginx available at: http://localhost:8001"
echo "🌐 Apache available at: http://localhost:8002"
