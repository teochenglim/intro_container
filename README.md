1. local setup

```bash
source .venv/bin/activate
uv sync

uv run python src/main.py

make run
```

2. docker setup

```bash
docker ps
docker build -t teochenglim/intro_container .
docker run -it teochenglim/intro_container bash


docker run -it teochenglim/intro_container
docker run -it -p 8000:8000 teochenglim/intro_container

make docker-build
make docker-run
```

3. docker compose

```bash
docker-compose up
docker compose up

make compose-up
make compose-down
```

4. kubernetes (k8s)

```bash
brew install kompose kind

kompose convert -f compose.yml

make kind-create
make k8s-apply

kubectl port-forward svc/intro-container 8000:8000

make k8s-delete
make kind-delete

```

5. helm

```bash

make helm-install
make helm-uninstall
```