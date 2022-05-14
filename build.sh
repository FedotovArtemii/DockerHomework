#!/bin/sh
docker buildx build -t todo-app/arm64 \
-f Dockerfile \
--platform=linux/arm64 . --load \
--build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ') \
--build-arg BUILD_COMMIT=$(git rev-parse --short HEAD) \
--build-arg VERSION=${1:-1}

docker buildx build -t todo-app/amd64 \
-f Dockerfile \
--platform=linux/amd64 . --load \
--build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ') \
--build-arg BUILD_COMMIT=$(git rev-parse --short HEAD) \
--build-arg VERSION=${1:-1}