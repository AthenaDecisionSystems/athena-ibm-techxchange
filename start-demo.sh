#!/bin/bash

# Ensure the script stops on errors
set -e

# Check for the existence of a .env file
if [ ! -f ".env" ]; then
    echo "Error: .env file is missing. Please ensure it exists in the current directory."
    exit 1
fi

# Run docker compose up in detached mode
echo "Starting the Athena IBU Insurance demo..."
docker compose up -d

echo "Athean IBU Insurance demo started successfully!  Go to http://localhost:3000/ to show it."
