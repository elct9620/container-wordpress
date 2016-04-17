IMAGE_NAME=elct9620/wordpress
CONTAINER_NAME=wordpress

all: build

build:
	@docker build -t ${IMAGE_NAME} .

quickstart: stop clean start

start:
	@echo "Starting NGINX"
	@docker run --name db mysql\
	@docker run --name ${CONTAINER_NAME} -d \
		-p 9000:9000 \
		-links db:mysql \
		${IMAGE_NAME}:latest

stop:
	@echo "Stopping NGINX"
	@docker stop ${CONTAINER_NAME}

clean:
	@echo "Clear Docker image"
	@docker rm ${CONTAINER_NAME} > /dev/null

logs:
	@docker logs -f ${CONTAINER_NAME}
