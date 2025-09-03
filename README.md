1. local setup

```bash
source .venv/bin/activate
uv sync
```

2. docker setup

```bash
docker ps
docker build -t teochenglim/intro_container .
docker run -it teochenglim/intro_container bash


docker run -it teochenglim/intro_container
docker run -it -p 8000:8000 teochenglim/intro_container

```

3. docker compose

```bash
docker-compose up
docker compose up
```

4. kubernetes (k8s)

```bash
brew install kompose kind

kompose convert -f compose.yml

```

5. helm

```bash

```