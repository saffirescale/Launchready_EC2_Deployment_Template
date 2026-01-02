#!/bin/bash
# Usage: sudo ./deploy_or_rollback.sh <docker_image>
set -e

IMAGE="$1"
APP_NAME="myapp"
NEW_CONTAINER="${APP_NAME}_new"
OLD_CONTAINER="${APP_NAME}_current"
HEALTHCHECK_URL="http://localhost:8080/healthz"
NGINX_CONFIG="/etc/nginx/conf.d/app.conf"

# Pull the new image
docker pull "$IMAGE"

# Stop and remove any previous new container
docker rm -f $NEW_CONTAINER 2>/dev/null || true

# Start new container (on port 8080)
docker run -d --name $NEW_CONTAINER -p 8080:80 "$IMAGE"

# Wait for the new container to be healthy
for i in {1..10}; do
  sleep 3
  if curl -fs $HEALTHCHECK_URL; then
    HEALTHY=1
    break
  fi
done

if [ "$HEALTHY" = "1" ]; then
  echo "New container is healthy. Switching Nginx upstream."
  # Stop and remove old container if exists
  docker rm -f $OLD_CONTAINER 2>/dev/null || true
  # Rename new container to current
  docker rename $NEW_CONTAINER $OLD_CONTAINER
  # Reload Nginx
  nginx -s reload || systemctl reload nginx
  echo "Deployment successful."
else
  echo "New container failed health check. Rolling back."
  docker rm -f $NEW_CONTAINER
  echo "Rollback complete."
  exit 1
fi
