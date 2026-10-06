.PHONY: setup test

setup:
	uv sync --locked

test:
	uv run pytest