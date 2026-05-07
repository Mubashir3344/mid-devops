#!/bin/bash
set -e

echo "=== Step 1: Fetching latest data from GitHub ==="
git pull origin main

echo "=== Step 2: Training the model ==="
python3 train.py

echo "=== Step 3: Rebuilding and restarting Docker container ==="
docker build -t ml-api .
docker stop ml-api-container 2>/dev/null || true
docker rm ml-api-container 2>/dev/null || true
docker run -d -p 8000:8000 --name ml-api-container ml-api

echo "=== Pipeline complete. API running at port 8000 ==="chmod +x pipeline.sh