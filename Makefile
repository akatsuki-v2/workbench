#!/usr/bin/make

REPO_DIR = repos

build: # build all containers
	@docker build -t user-gateway-service:latest $(REPO_DIR)/user-gateway-service
	@docker build -t users-service:latest $(REPO_DIR)/users-service
	@docker build -t bancho-service:latest $(REPO_DIR)/bancho-service
	@docker build -t chat-service:latest $(REPO_DIR)/chat-service
	@docker build -t beatmaps-service:latest $(REPO_DIR)/beatmaps-service

clone: # clone all containers
	@git submodule init

pull: # pull all containers
	cd $(REPO_DIR)/user-gateway-service && git pull
	cd $(REPO_DIR)/users-service && git pull
	cd $(REPO_DIR)/bancho-service && git pull
	cd $(REPO_DIR)/chat-service && git pull
	cd $(REPO_DIR)/beatmaps-service && git pull

run-bg: # run all containers in the background
	@docker-compose up -d \
		nginx \
		mysql \
		redis \
		user-gateway-service \
		users-service \
		bancho-service \
		chat-service \
		beatmaps-service

run: # run all containers in the foreground
	@docker-compose up \
		nginx \
		mysql \
		redis \
		user-gateway-service \
		users-service \
		bancho-service \
		chat-service \
		beatmaps-service

logs: # show logs for all containers
	@docker-compose logs -f
