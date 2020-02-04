build-image:
	docker build -t phyzical/jnlp-slave-node .
send-image:
	docker push phyzical/jnlp-slave-node

build-and-send:
	make build-image
	make send-image

