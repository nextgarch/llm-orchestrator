#!/bin/bash
export STORAGE_LOCATION=/tmp/anythingllm
rm -rf $STORAGE_LOCATION

docker stop anythingllm
docker rm anythingllm