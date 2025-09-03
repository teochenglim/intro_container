APP_NAME=intro_container
DOCKER_IMAGE=teochenglim/$(APP_NAME):latest

# Local run
run:
	uv run python main.py

# Docker
docker-build:
	docker build -t $(DOCKER_IMAGE) .

docker-run:
	docker run -p 8000:8000 $(DOCKER_IMAGE)

# Docker Compose
compose-up:
	docker-compose up --build

compose-down:
	docker-compose down

# Kind
kind-create:
	kind create cluster --name test

kind-delete:
	kind delete cluster --name test

k8s-apply:
	kubectl apply -f k8s/

k8s-delete:
	kubectl delete -f k8s/

# Helm
helm-install:
	helm upgrade --install sre ./helm/

helm-uninstall:
	helm uninstall sre
