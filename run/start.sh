#! /bin/sh

DOCKER_IMAGE=ft_onion
DOCKER_NAME=ft_onion
HTML_PATH=$PWD"/configuration/index.html"
CONFIG_PATH=$PWD"/configuration/nginx.conf"
SSHD_CONFIG_PATH=$PWD"/configuration/sshd_config"
TORRC_CONFIG_PATH=$PWD"/configuration/torrc"
HIDDEN_SERVICE_PATH="/var/lib/tor/"

docker rm -fv $DOCKER_NAME && \
	docker run --name $DOCKER_NAME \
	-p 80:80 \
	-p 4242:4242 \
	-v $HTML_PATH:/usr/share/nginx/html/index.html \
	-v $CONFIG_PATH:/etc/nginx/nginx.conf \
	-v $SSHD_CONFIG_PATH:/etc/ssh/sshd_config \
	-v $TORRC_CONFIG_PATH:/etc/tor/torrc \
	-d $DOCKER_IMAGE

docker cp ft_onion:$HIDDEN_SERVICE_PATH"hidden_service/hostname" hostname/html_hostname
docker cp ft_onion:$HIDDEN_SERVICE_PATH"ssh_hidden_service/hostname" hostname/ssh_hostname
