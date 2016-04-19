#!/bin/bash

# Remove any stopped containers
docker rm $(docker ps -q --filter status=exited)

# Remove any dangling Docker images
docker rmi $(docker images -q --filter dangling=true)

# Remove Docker images that are 7 days or older (keep images for master or next)
images=$(docker images)
while read -r line; do
    name=$(echo $line | cut -d" " -f1)
    tag=$(echo $line | cut -d" " -f2)
    old=$(echo $line | grep -E "(7|8|9|10|11|12|13) days|weeks|months|years) ago")
    if [ -n "$old" ]; then
        image=$(echo $name | grep -E "johannr/bamboo\-|\-builder" | grep -v -E "master|next")
	if [ -n "$image" ]; then
            docker rmi $name:$tag
        fi
    fi
done <<< "$images"
