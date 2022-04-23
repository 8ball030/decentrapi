version=1.0
githash := $(shell git rev-parse --short HEAD)
registry=rayspock

# build image
.PHONY: build
build:
	echo "building ${version}-${githash}"
	VERSION=${version} COMMIT_HASH=${githash} DOCKER_REGISTRY=${registry} docker-compose -f docker-compose.build.yaml build

# push-images pushes the images to a container registry
.PHONY: push-images
push-images:
	VERSION=${version} COMMIT_HASH=${githash} DOCKER_REGISTRY=${registry} docker-compose -f docker-compose.build.yaml push
