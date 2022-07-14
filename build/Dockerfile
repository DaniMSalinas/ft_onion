FROM debian:latest

RUN apt-get update -y
RUN apt-get install nginx -y 
RUN apt-get install openssh-server -y
RUN apt-get install vim -y
RUN apt-get install tor -y

COPY ./docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
