#!/usr/bin/make

REPO_DIR = repos

build: # build all containers
	@docker build -t user-gateway-service:latest $(REPO_DIR)/user-gateway-service
	@docker build -t user-accounts-service:latest $(REPO_DIR)/user-accounts-service

clone: # clone all containers
	@if [ ! -d $(REPO_DIR)/user-gateway-service ]; then git clone git@github.com:akatsuki-v2/user-gateway-service.git $(REPO_DIR)/user-gateway-service; fi
	@if [ ! -d $(REPO_DIR)/user-accounts-service ]; then git clone git@github.com:akatsuki-v2/user-accounts-service.git $(REPO_DIR)/user-accounts-service; fi

pull: # pull all containers
	cd $(REPO_DIR)/user-gateway-service && git pull
	cd $(REPO_DIR)/user-accounts-service && git pull

run: # run all containers
	@docker-compose up \
		mysql \
		rabbitmq \
		redis \
		elasticsearch \
		user-gateway-service \
		user-accounts-service
