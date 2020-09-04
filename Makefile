
.PHONY: docker-build
docker-build:
	docker build -t vulcanize/dapptools -f docker/Dockerfile .