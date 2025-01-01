# Makefile for building and running the Docker container

# Image name
IMAGE_NAME = multi-compiler-env
MOUNT_CODE = -v $(if $(MOUNT),$(MOUNT),./opt):/opt

# Build the Docker image
build:
	docker build -t $(IMAGE_NAME) .

# Run the Docker container with default shell (bash)
run: stop rm
	docker run -it --name $(IMAGE_NAME) $(MOUNT_CODE) $(IMAGE_NAME)

# Run the Docker container with sh shell
run-sh:
	docker run -it --entrypoint /bin/sh --name $(IMAGE_NAME) $(MOUNT_CODE) $(IMAGE_NAME)

# Run the Docker container with zsh shell
run-zsh:
	docker run -it --entrypoint /bin/zsh --name $(IMAGE_NAME) $(MOUNT_CODE) $(IMAGE_NAME)

# Run the Docker container with tcsh shell
run-tcsh:
	docker run -it --entrypoint /bin/tcsh --name $(IMAGE_NAME) $(MOUNT_CODE) $(IMAGE_NAME)

# Clean up the Docker image
clean:
	docker rmi $(IMAGE_NAME)

# Attach to the running Docker container
attach:
	docker exec -it $(IMAGE_NAME) /bin/bash

stop:
	docker stop $(IMAGE_NAME)

rm:
	docker rm $(IMAGE_NAME)

# Default target
all: build run
