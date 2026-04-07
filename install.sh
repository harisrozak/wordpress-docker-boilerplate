#!/bin/bash

set -e

echo "Creating plugins and themes directories..."
mkdir -p plugins themes

echo "Setting permissions..."
sudo chown -R $USER:$USER plugins themes
chmod -R 777 plugins themes

echo "Starting containers..."
docker compose up -d

echo ""
echo "Done!"
echo "  WordPress → http://localhost:$(grep ^PORT .env | cut -d '=' -f2)"
echo "  Adminer   → http://localhost:$(grep ^ADMINER_PORT .env | cut -d '=' -f2)"
