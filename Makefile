#!/usr/bin/make

REPO_DIR = repos

build: # build all containers
	@docker build -t user-gateway-service:latest $(REPO_DIR)/user-gateway-service
	@docker build -t user-accounts-service:latest $(REPO_DIR)/user-accounts-service
	@docker build -t clans-service:latest $(REPO_DIR)/clans-service
	@docker build -t beatmaps-service:latest $(REPO_DIR)/beatmaps-service
	@docker build -t bancho-service:latest $(REPO_DIR)/bancho-service

clone: # clone all containers
	@if [ ! -d $(REPO_DIR)/user-gateway-service ]; then git clone git@github.com:akatsuki-v2/user-gateway-service.git $(REPO_DIR)/user-gateway-service; fi
	@if [ ! -d $(REPO_DIR)/user-accounts-service ]; then git clone git@github.com:akatsuki-v2/user-accounts-service.git $(REPO_DIR)/user-accounts-service; fi
	@if [ ! -d $(REPO_DIR)/clans-service ]; then git clone git@github.com:akatsuki-v2/clans-service.git $(REPO_DIR)/clans-service; fi
	@if [ ! -d $(REPO_DIR)/beatmaps-service ]; then git clone git@github.com:akatsuki-v2/beatmaps-service.git $(REPO_DIR)/beatmaps-service; fi
	@if [ ! -d $(REPO_DIR)/bancho-service ]; then git clone git@github.com:akatsuki-v2/bancho-service.git $(REPO_DIR)/bancho-service; fi

pull: # pull all containers
	cd $(REPO_DIR)/user-gateway-service && git pull
	cd $(REPO_DIR)/user-accounts-service && git pull
	cd $(REPO_DIR)/clans-service && git pull
	cd $(REPO_DIR)/beatmaps-service && git pull
	cd $(REPO_DIR)/bancho-service && git pull

run-bg: # run all containers in the background
	@docker-compose up -d \
		postgres \
		user-gateway-service \
		user-accounts-service \
		clans-service \
		beatmaps-service \
		bancho-service
		# rabbitmq \
		# redis \
		# elasticsearch \

run: # run all containers in the foreground
	@docker-compose up \
		postgres \
		user-gateway-service \
		user-accounts-service \
		clans-service \
		beatmaps-service \
		bancho-service
		# rabbitmq \
		# redis \
		# elasticsearch \
