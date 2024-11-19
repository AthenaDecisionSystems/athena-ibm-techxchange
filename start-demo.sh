#!/bin/bash

# Ensure the script stops on errors
set -e

# Check for the existence of a .env file
if [ ! -f ".env" ]; then
    echo "Error: .env file is missing. Please ensure it exists in the current directory."
    exit 1
fi

# Run docker compose up in detached mode
echo "Starting Docker Compose..."
docker compose up -d

echo "Docker Compose started successfully!"
