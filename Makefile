all: build deploy

build:
	docker build -t srfrnk/flink-base -f docker/Dockerfile.flink-base docker
	docker build -t srfrnk/flink -f docker/Dockerfile.flink docker
	docker build -t srfrnk/beam-flink -f docker/Dockerfile.beam-flink docker

deploy: build
	kubectl apply -f k8s/

destroy:
	kubectl delete -f k8s/
