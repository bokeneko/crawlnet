DPS=${shell docker ps -a --filter="label=com.bokeneko.crawlnet" --format "{{.ID}}"}
DIMS=${shell docker images --filter="label=com.bokeneko.crawlnet" -q}

all: build

clean:
	if [ -n "${DPS}" ]; then \
		docker stop ${DPS}; \
		docker rm ${DPS}; \
	fi
	if [ -n "${DIMS}" ]; then \
		docker rmi ${DIMS} \
	fi
	rm -rf bokeneko_crawlnet_docker_image.tar.gz


build:
	 docker build -t bokeneko/crawlnet:1.0 .

save:
	 docker save bokeneko/crawlnet | gzip >  bokeneko_crawlnet_docker_image.tar.gz


.PHONY: all clean build save
