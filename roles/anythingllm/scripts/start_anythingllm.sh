#!/bin/bash
export STORAGE_LOCATION=/tmp/anythingllm
mkdir -p $STORAGE_LOCATION
touch "$STORAGE_LOCATION/.env"
# allow anyone to read/write/execute
chmod -R 777 $STORAGE_LOCATION

docker run -d --network=host \
    --cap-add SYS_ADMIN \
    -v ${STORAGE_LOCATION}:/app/server/storage \
    -v ${STORAGE_LOCATION}/.env:/app/server/.env \
    -e STORAGE_DIR="/app/server/storage" \
    --name anythingllm \
    mintplexlabs/anythingllm