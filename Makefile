#!/usr/bin/make

REPO_DIR = repos

build: # build all containers
	@docker build -t user-gateway-service:latest $(REPO_DIR)/user-gateway-service
	@docker build -t users-service:latest $(REPO_DIR)/users-service
	@docker build -t bancho-service:latest $(REPO_DIR)/bancho-service
	# @docker build -t beatmaps-service:latest $(REPO_DIR)/beatmaps-service
	# @docker build -t clans-service:latest $(REPO_DIR)/clans-service
	@docker build -t chat-service:latest $(REPO_DIR)/chat-service

clone: # clone all containers
	@if [ ! -d $(REPO_DIR)/user-gateway-service ]; then git clone git@github.com:akatsuki-v2/user-gateway-service.git $(REPO_DIR)/user-gateway-service; fi
	@if [ ! -d $(REPO_DIR)/users-service ]; then git clone git@github.com:akatsuki-v2/users-service.git $(REPO_DIR)/users-service; fi
	@if [ ! -d $(REPO_DIR)/bancho-service ]; then git clone git@github.com:akatsuki-v2/bancho-service.git $(REPO_DIR)/bancho-service; fi
	# @if [ ! -d $(REPO_DIR)/beatmaps-service ]; then git clone git@github.com:akatsuki-v2/beatmaps-service.git $(REPO_DIR)/beatmaps-service; fi
	# @if [ ! -d $(REPO_DIR)/clans-service ]; then git clone git@github.com:akatsuki-v2/clans-service.git $(REPO_DIR)/clans-service; fi
	@if [ ! -d $(REPO_DIR)/chat-service ]; then git clone git@github.com:akatsuki-v2/chat-service.git $(REPO_DIR)/chat-service; fi

pull: # pull all containers
	cd $(REPO_DIR)/user-gateway-service && git pull
	cd $(REPO_DIR)/users-service && git pull
	cd $(REPO_DIR)/bancho-service && git pull
	# cd $(REPO_DIR)/beatmaps-service && git pull
	# cd $(REPO_DIR)/clans-service && git pull
	cd $(REPO_DIR)/chat-service && git pull

run-bg: # run all containers in the background
	@docker-compose up -d \
		nginx \
		postgres \
		redis \
		user-gateway-service \
		users-service \
		bancho-service \
		chat-service
		# beatmaps-service \
		# clans-service \

run: # run all containers in the foreground
	@docker-compose up \
		nginx \
		postgres \
		redis \
		user-gateway-service \
		users-service \
		bancho-service \
		chat-service
		# beatmaps-service \
		# clans-service \
