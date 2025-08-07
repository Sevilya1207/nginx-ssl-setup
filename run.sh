#!/bin/bash

# Step 1: Run Docker Compose
echo "🚀 Starting Docker containers..."
sudo docker compose up -d --build

if [[ $? -ne 0 ]]; then
  echo "❌ Failed to start Docker containers. Aborting."
  exit 1
fi

# Step 2: Ask about SSL setup
echo ""
read -p "🔐 Do you want to setup Let's Encrypt SSL now? (y/n): " SETUP_SSL

if [[ "$SETUP_SSL" == "y" || "$SETUP_SSL" == "Y" ]]; then
  if [[ ! -f ./setup_ssl.sh ]]; then
    echo "❌ setup_ssl.sh not found in current directory."
    exit 1
  fi

  chmod +x setup_ssl.sh
  ./setup_ssl.sh
else
  echo "⚠️ Skipping SSL setup. Your site will run over HTTP only."
fi
