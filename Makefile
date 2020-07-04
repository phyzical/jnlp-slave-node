-include ../infrastructure/deploy/makefile-docker.mk

PROJECT_NAME=jnlp-slave
DOCKER_REPO_NAME=phyzical
DOCKER_IMAGES=jnlp-slave
DEPLOYMENT_SLACK_MESSAGE=*${PROJECT_NAME}* \n ${CURRENT_TARGET_TAG} \n ${CURRENT_TARGET_SERVER_ALIAS} \n ${BUILD_URL}

build-and-send-slave:
	make build-image IMAGE_NAME=jnlp-slave
	make send-image IMAGE_NAME=jnlp-slave
