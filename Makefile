
.PHONY: up down build check fix

up:
	${INFO} "Up dockers"
	@ docker-compose up -d
	${INFO} "UP complete"

down:
	${INFO} "Down dockers"
	@ docker-compose down
	${INFO} "Down complete"

build:
	${INFO} "Start build"
	@ docker-compose build
	${INFO} "Finish build"

check:
	${INFO} "Start checking code"
	@ composer cs-check
	${INFO} "Finish checking code"

fix:
	${INFO} "Start fixing code"
	@ composer cs-fix
	${INFO} "Finish fixing code"

# Cosmetics
YELLOW := "\e[1;33m"
NC := "\e[0m"

# Shell Functions
INFO := @bash -c '\
  printf $(YELLOW); \
  echo "=> $$1"; \
  printf $(NC)' SOME_VALUE
