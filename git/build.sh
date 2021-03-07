#!/bin/bash

docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 --push -t dwinks/init_containers:git-init .