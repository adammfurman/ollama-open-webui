#!/bin/bash

# ---- 0 Establish Error Handling ------------------------------
# 'set' sets shell variables and options
# -e tells shell to exit immediately if a command exits with an error
# -u tells shell to treat setting of an unset variable as an error
# -o specifies additional options
# pipefail makes the script exit if any command in the pipeline fails
set -euo pipefail

# ---- 1️ Docker Desktop ---------------------------------------
# Check if Docker Desktop process is running on macOS, if not, open it in background
# "> /dev/null 2>&1" discards stdout and stderr to null
if ! docker ps >/dev/null 2>&1; then
  echo "🐳 Starting Docker Desktop…"
  open -a Docker --args --background
  # Wait until the Docker daemon is ready
  while ! docker version >/dev/null 2>&1; do sleep 1; done
else
  echo "🐳 Docker is already running…"
fi

# ---- 2️ Ollama App --------------------------------------------
# Check if Ollama is running, if not, open it hidden (no GUI)
if ! pgrep -f "/Applications/Ollama.app" >/dev/null; then
  echo "🦙 Launching Ollama hidden…"
  open /Applications/Ollama.app --args --hide
  # Wait until its REST API is up
  while ! curl -s -f http://localhost:11434/api/tags >/dev/null 2>&1; do sleep 1; done
else
  echo "🦙 Ollama is already running…"
fi

# ---- 3️ Open‑WebUI Docker container ----------------------------
# Check if docker container is up, if not, run the docker-compose.yml file
if ! docker ps | grep open-webui >/dev/null; then
  echo "📦 Bringing up Open‑WebUI container…"
  docker compose -f '/Users/adam/.local/share/docker-compose/open-webui/docker-compose.yml' up -d
else
  echo "📦 Open-WebUI container is already up…"
fi

# Optional: wait until the UI is responsive (health endpoint)
echo "🔍 Waiting for Open‑WebUI to be ready…"
while ! curl -s -f http://localhost:3000/health >/dev/null 2>&1; do sleep 1; done

# ---- 4️ Open the UI in the default browser --------------------
open http://localhost:3000

echo "✅ All set!"

