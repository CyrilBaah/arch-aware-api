# Makefile for arch-aware-api

.PHONY: help install run docker-build docker-run docker-stop docker-remove

help:
	@echo "Available targets:"
	@echo "  install        Install dependencies using pip."
	@echo "  run            Run the FastAPI app with uvicorn."
	@echo "  clean          Remove __pycache__ and .pyc files."
	@echo "  docker-build   Build the Docker image."
	@echo "  docker-run     Run the Docker container."
	@echo "  docker-stop    Stop the Docker container."
	@echo "  docker-remove  Remove the Docker container."

install:
	. env/bin/activate && pip install -r requirements.txt || echo 'No requirements.txt found.'

run:
	. env/bin/activate && uvicorn app:app --reload

docker-build:
	docker build -t arch-aware-api .

docker-run:
	docker run -d --name arch-aware-api -p 8000:8000 arch-aware-api

docker-stop:
	docker stop arch-aware-api || true

docker-remove:
	docker rm arch-aware-api || true

clean:
	find . -type d -name '__pycache__' -exec rm -rf {} +
	find . -type f -name '*.pyc' -delete
