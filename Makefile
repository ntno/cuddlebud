init:
	source set-secrets.sh

post: check-file
	source scripts/get-secrets.sh && source post-to-discord.sh $$file

docker:
	docker-compose run build

check-file:
ifndef file
	$(error file not defined.  Please provide a file location.)
endif