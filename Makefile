

IMAGE=amarburg/lsdslam-dev-host:latest

all: build push

build:
	docker build -t ${IMAGE} .

push:
	docker push ${IMAGE}

.PHONY: all build push
