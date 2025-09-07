
# RTSP + MediaMTX (Bluenviron) with Docker Compose

This repository provides a docker-compose setup for working with RTSP streams locally or on a remote server.
It is designed to be flexible enough to support both development and production scenarios with NVIDIA VSS or standalone utility mode.

```bash
📂 Project Structure
.
├── compose.rstp.yml        # Docker Compose file for RTSP/MediaMTX
├── compose.milvus.yml       # Docker Compose file for standalone Milvus DB
├── rstp_in/                 # Input sources (e.g., MP4 files, stream configs)
├── rstp_out/                # Output directory for generated RTSP streams
└── README.md
```


- rstp_in/ → Stores RTSP input files or configs.
- rstp_out/ → Collects RTSP output streams when running locally with Docker.
- compose.rstp.yml → Runs the Bluenviron MediaMTX
 container as an RTSP server.
- compose.milvus.yml → Spins up a standalone Milvus
 vector database for local development.

## 1 . manually doing it with docker

If you want to test without docker-compose:

```bash
docker run --rm -it -p 8554:8554 -v ./rstp_in:/rstp_in -v "$PWD/rstp_in/mediamtx.yml:/mediamtx.yml:ro" bluenviron/mediamtx:latest-ffmpeg-rpi

```

2. Run with Docker Compose (recommended)


Start the RTSP service:

```bash
docker compose -f compose.rstp.yml up -d

```

Stop the service:

```bash
docker compose -f compose.rstp.yml down

```


3. Play the Stream

Open the stream in VLC or another RTSP client:

```bash
brew install vlc
open rstp://127.0.0.1:8554/stream

```


## 🔧 Development vs Production Scenarios
Scenario	Input Location	Notes
Local Dev	./rstp_in/*.mp4	Mount local MP4s, stream into VLC.
Remote Dev	/data/*.mp4 on server	Ensure /data is bind-mounted inside container.
Production	RTSP feed from cameras / NVIDIA VSS	Configure mediamtx.yml with external source URLs.


## 🛠 Future Goals

- Support hybrid mode: local MP4 + RTSP camera sources.
- Integrate NVIDIA VSS as utility for preprocessing.
- Ensure compatibility with Milvus for storing metadata or video embeddings.
- Expand CI/CD to validate both dev and prod pipelines.

## 📖 References

[Bluenviron MediaMTX](https://github.com/bluenviron/mediamtx)
[Milvus Vector Database]https://milvus.io/)