1. local setup

```bash
pip install uv

git clone https://github.com/teochenglim/intro_container
cd intro_container

source .venv/bin/activate
uv sync

uv run python src/main.py

### using make
make run
```

2. docker setup

```bash
### install colima and docker client
brew install colima docker
### initialise colima
colima start

### check docker is running
docker ps

### build docker from Dockerfile and name it [docker_registry_user_name]/intro_container
docker build -t teochenglim/intro_container .
### run it with interactive shell
docker run -it teochenglim/intro_container bash

### Run the app
docker run -it teochenglim/intro_container

### run the app with port 8000 exported, so that you can test on browser
docker run -it -p 8000:8000 teochenglim/intro_container

### using make
make docker-build
make docker-run
```

3. docker compose

```bash
### us docker compose to bring up the compose.yml file
docker-compose up
docker compose up

[Ctrl + C]
docker compose down

### using make
make compose-up
make compose-down
```

4. kubernetes (k8s)

```bash
### install kind and kompose helper
brew install kompose kind

### convert docker compose to k8s, become 2 files
kompose convert -f compose.yml

### using make
make kind-create
make k8s-apply

### export app port
kubectl port-forward svc/intro-container 8000:8000
### export metrics port
kubectl port-forward svc/intro-container 8080:8080

make k8s-delete
make kind-delete

```

5. helm

```bash
### if you want to do it manually
helm upgrade --install sre ./helm/
helm uninstall sre

### using make
make helm-install

### export app port
kubectl port-forward svc/fastapi-sre 8000:8000
### export metrics port
kubectl port-forward svc/fastapi-sre 8080:8080

make helm-uninstall
```