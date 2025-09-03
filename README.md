1. local setup

```bash
source .venv/bin/activate
uv sync

uv run python src/main.py

### using make
make run
```

2. docker setup

```bash
docker ps
docker build -t teochenglim/intro_container .
docker run -it teochenglim/intro_container bash


docker run -it teochenglim/intro_container
docker run -it -p 8000:8000 teochenglim/intro_container

### using make
make docker-build
make docker-run
```

3. docker compose

```bash
docker-compose up
docker compose up

### using make
make compose-up
make compose-down
```

4. kubernetes (k8s)

```bash
### install kind and kompose helper
brew install kompose kind

### convert docker compose to k8s
kompose convert -f compose.yml

### using make
make kind-create
make k8s-apply

kubectl port-forward svc/intro-container 8000:8000

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

kubectl port-forward svc/fastapi-sre 8000:8000

make helm-uninstall
```