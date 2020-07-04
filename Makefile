build-image:
	docker build -t phyzical/jnlp-slave-node .
send-image:
	docker push phyzical/jnlp-slave-node

build-and-send:
	make build-image
	make send-image

DEPLOYMENT_SLACK_HOOK=
DEPLOYMENT_MESSAGE=
deploy-slack-notification:
	curl -X POST -H 'Content-type: application/json' --data '{"text":"${DEPLOYMENT_MESSAGE}"}' ${DEPLOYMENT_SLACK_HOOK};
