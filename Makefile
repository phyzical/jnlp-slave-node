-include ../infrastructure/deploy/makefile-docker.mk

PROJECT_NAME=jnlp-slave
DOCKER_REPO_NAME=phyzical
DOCKER_IMAGES=jnlp-slave

build-and-send-slave:
	make build-image IMAGE_NAME=jnlp-slave
	make send-image IMAGE_NAME=jnlp-slave
