.PHONY: setup test lint format

setup:
	uv sync --locked
	uv run pre-commit install

test:
	uv run pytest

lint:
	uv run ruff check .
	uv run ruff format --check .

format:
	uv run ruff format .
	uv run ruff check --fix .

.PHONY: setup test lint format docker-build docker-test

docker-build:
	docker build -t infraestructura-publica-cl .

docker-test: docker-build
	docker run --rm infraestructura-publica-cl
