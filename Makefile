VIRTUALENV ?= virtualenv

.PHONY: install
install: .venv/bin/docker-compose

.PHONY: build
build:
	docker build -t mapproxy .

.PHONY: run
run:
	docker run -it --name mapproxy -e PROCESSES=4 mapproxy

.PHONY: rm
rm:
	docker rm -f mapproxy

.PHONY: stack-up
stack-up: .venv/bin/docker-compose
	.venv/bin/docker-compose up

.PHONY: stack-down
stack-down: .venv/bin/docker-compose
	.venv/bin/docker-compose rm -sf

.PHONY: rm-dangling-images
rm-dangling-images:
	@docker images -f "dangling=true" -q | xargs --no-run-if-empty docker rmi

.PHONY: clean
clean:
	rm -rf .venv

.venv/bin/docker-compose: .venv/bin/python3
	.venv/bin/pip install docker-compose

.venv/bin/python3:
	$(VIRTUALENV) .venv
