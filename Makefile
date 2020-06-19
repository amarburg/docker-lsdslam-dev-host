

IMAGE=amarburg/lsdslam-dev-host:latest

all: build push

build:
	docker build -t ${IMAGE} .

blackmagic: build
	docker build --file Dockerfile.blackmagic --tag amarburg/lsdslam-dev-host-blackmagic:latest .
	docker push amarburg/lsdslam-dev-host-blackmagic:latest

push:
	docker push ${IMAGE}


.PHONY: all build push
