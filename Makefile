# Just a Makefile for manual testing
.PHONY: local-dev

.EXPORT_ALL_VARIABLES:

# These can be overriden from global environment variables

# or a property file
include .env

all: clean build

clean:
	echo "Cleaned"

build:
	echo "Done"

wp-start:
	docker-compose -f project/docker-compose.yaml up --build

wp-stop:
	docker-compose -f project/docker-compose.yaml up --build

db-connect:
	docker-compose -f project/docker-compose.yaml exec db bash
