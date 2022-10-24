#!/usr/bin/make

REPO_DIR = repos

build: # build all containers
	@docker build -t user-gateway-service:latest $(REPO_DIR)/user-gateway-service
	@docker build -t admins-gateway-service:latest $(REPO_DIR)/admins-gateway-service
	@docker build -t users-service:latest $(REPO_DIR)/users-service
	@docker build -t admins-service:latest $(REPO_DIR)/admins-service
	@docker build -t bancho-service:latest $(REPO_DIR)/bancho-service
	@docker build -t chat-service:latest $(REPO_DIR)/chat-service
	@docker build -t beatmaps-service:latest $(REPO_DIR)/beatmaps-service
	@docker build -t scores-service:latest $(REPO_DIR)/scores-service

rebuild: # build all containers without cache
	@docker build --no-cache -t user-gateway-service:latest $(REPO_DIR)/user-gateway-service
	@docker build --no-cache -t admins-gateway-service:latest $(REPO_DIR)/admins-gateway-service
	@docker build --no-cache -t users-service:latest $(REPO_DIR)/users-service
	@docker build --no-cache -t admins-service:latest $(REPO_DIR)/admins-service
	@docker build --no-cache -t bancho-service:latest $(REPO_DIR)/bancho-service
	@docker build --no-cache -t chat-service:latest $(REPO_DIR)/chat-service
	@docker build --no-cache -t beatmaps-service:latest $(REPO_DIR)/beatmaps-service
	@docker build --no-cache -t scores-service:latest $(REPO_DIR)/scores-service

clone: # clone all containers
	@git submodule init

pull: # pull all containers
	cd $(REPO_DIR)/user-gateway-service && git pull
	cd $(REPO_DIR)/admins-gateway-service && git pull
	cd $(REPO_DIR)/users-service && git pull
	cd $(REPO_DIR)/admins-service && git pull
	cd $(REPO_DIR)/bancho-service && git pull
	cd $(REPO_DIR)/chat-service && git pull
	cd $(REPO_DIR)/beatmaps-service && git pull
	cd $(REPO_DIR)/scores-service && git pull

run-bg: # run all containers in the background
	@docker-compose up -d \
		nginx \
		mysql \
		redis \
		user-gateway-service \
		admins-gateway-service \
		users-service \
		admins-service \
		bancho-service \
		chat-service \
		beatmaps-service \
		scores-service

run: # run all containers in the foreground
	@docker-compose up \
		nginx \
		mysql \
		redis \
		user-gateway-service \
		admins-gateway-service \
		users-service \
		admins-service \
		bancho-service \
		chat-service \
		beatmaps-service \
		scores-service

logs: # show logs for all containers
	@docker-compose logs -f
