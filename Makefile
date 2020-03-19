init:
	source set-secrets.sh

post: check-file
	source scripts/get-secrets.sh && source post-to-discord.sh $$file

check-file:
ifndef file
	$(error file not defined.  Please provide a file location.)
endif