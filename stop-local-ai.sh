#!/bin/bash

# ---- 0 Establish Error Handling ------------------------------
# 'set' sets shell variables and options
# -e tells shell to exit immediately if a command exits with an error
# -u tells shell to treat setting of an unset variable as an error
# -o specifies additional options
# pipefail makes the script exit if any command in the pipeline fails
set -euo pipefail

# ---- 1 Shutdown Open WebUI Docker Container -------------------
if docker version > /dev/null 2>&1; then
    echo "📦 Shutting down Open-WebUI container…"
    docker compose -f "/Users/adam/.local/share/docker-compose/open-webui/docker-compose.yml" down
else
    echo "📦 Open-WebUI container already down…"
fi

# ---- 2 Docker Desktop -----------------------------------------
# Quit Docker Desktop (Optional)
if pgrep -f "/Applications/Docker.app" >/dev/null 2>&1; then
    killall 'Docker Desktop'
    echo "🐳 Quitting Docker…"
else
    echo "🐳 Docker is not open…"
fi

# ---- 3 Ollama -------------------------------------------------
# Quit Ollama
if pgrep -f "/Applications/Ollama.app" >/dev/null 2>&1; then
    killall Ollama
    echo "🦙 Quitting Ollama…"
else
    echo "🦙 Ollama is not open…"
fi

# ---- 4 Done  ---------------------------------------------------
# You can add validation tests here if you want…
echo "✅ Done"


# Script created by https://adamfurman.me