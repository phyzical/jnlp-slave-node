-include ../infrastructure/deploy/makefile-docker.mk

PROJECT_NAME=jnlp-slave-node
DOCKER_REPO_NAME=phyzical
DOCKER_IMAGES=jnlp-slave-node

build-and-send-slave:
	make build-image IMAGE_NAME=jnlp-slave-node
	make send-image IMAGE_NAME=jnlp-slave-node
