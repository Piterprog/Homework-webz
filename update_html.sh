#!/bin/bash

# Array with container names
containers=("webz-001" "webz-002" "webz-003")

# Target HTML file to update
target_path="/var/www/html/index.html"

# Loop through all containers
for container in "${containers[@]}"; do
  # Check if the container is running
  if [ "$(docker ps -q -f name=$container)" ]; then
    echo "Updating HTML in $container..."

    # Check if vim is installed, and install it if not
    docker exec -it "$container" bash -c "command -v vim >/dev/null 2>&1 || apt-get update && apt-get install -y vim"
    
    # Add the service name to the HTML file
    docker exec -it "$container" bash -c "echo '<h3>Name-Service: $container</h3>' >> $target_path"
  else
    echo "Container $container is not running!"
  fi
done
