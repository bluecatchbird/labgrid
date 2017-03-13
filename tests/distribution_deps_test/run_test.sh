#!/bin/sh -ex

IMAGETAG=labgrid-test

function cleanup_images() {
	for IMAGE in $(docker images | grep $IMAGETAG | awk '{print $3}')
	do
		docker rmi $IMAGE
	done
}




for DOCKERFILE in Dockerfile.*
do
	cleanup_images
	
	docker build \
		   -t $IMAGETAG \
		   --file $DOCKERFILE .
done


cleanup_images
