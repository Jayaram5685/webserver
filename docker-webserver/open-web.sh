#!/bin/bash

#start containers if not runnning 

docker compose up -d

#wait a few seconds to make sure servers are ready 

sleep 5

# Getv container status

echo "Current running containers:"
docker ps

#Open Nginx and Apache in browser
echo "Opening Nginx (http://localhost:8001) and Apache (http://localhost:8002)..."
xdg-open http://localhost:8001
xdg-open http://localhost:8002
