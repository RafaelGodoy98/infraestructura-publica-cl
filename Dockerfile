FROM python:3.13-slim

COPY --from=ghcr.io/astral-sh/uv:0.12.23 /uv /uvx /bin/

WORKDIR /app

COPY pyproject.toml uv.lock .python-version README.md ./
RUN uv sync --locked --no-install-project

COPY src/ src/
COPY tests/ tests/
RUN uv sync --locked

CMD ["uv", "run", "pytest"]
