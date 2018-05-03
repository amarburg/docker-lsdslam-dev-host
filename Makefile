

IMAGE=amarburg/lsdslam-dev-host:latest

build:
	docker build -t ${IMAGE} .

push:
	docker push ${IMAGE}

.PHONY: build push
