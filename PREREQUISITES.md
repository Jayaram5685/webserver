# Prerequisites

This project uses Docker and Docker Compose to run Nginx and Apache containers. Follow the steps below for your operating system. Commands are shown with inline comments so you can see what each step does.

## What you need
- Docker Engine (provides the docker CLI and backend daemon)
- Docker Compose (either the v2 plugin accessed via `docker compose` or the legacy `docker-compose` binary)

## macOS (Docker Desktop)
1) Install Docker Desktop for Mac
- Download and install from the official Docker website.
- After installation, open the Docker Desktop application and wait until it shows Docker is running.

2) Verify Docker and Compose
```bash
# Show the Docker client version; confirms CLI is installed
docker --version

# Query the daemon for system info; confirms the engine is running
docker info

# Compose v2 is included with Docker Desktop; this should work
docker compose version
```

3) If docker info fails
- Make sure Docker Desktop is actually running (icon should indicate running).
- Quit and reopen Docker Desktop if needed, then try the verify commands again.

## Linux (Ubuntu/Debian-based)
1) Set up Docker’s official apt repository
```bash
# Refresh package index
sudo apt update

# Install tools required to add a new apt repository and handle GPG keys
sudo apt install -y ca-certificates curl gnupg

# Create the keyring directory (stores the Docker repo GPG key securely)
sudo install -m 0755 -d /etc/apt/keyrings

# Download Docker’s GPG key and convert it to keyring format
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Add Docker’s apt repository (stable channel) using your distro codename
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo $VERSION_CODENAME) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Refresh package index to include Docker repo packages
sudo apt update
```

2) Install Docker Engine and Compose plugin
```bash
# Install the engine, CLI, container runtime, Buildx, and the Compose v2 plugin
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

3) Optional: install legacy docker-compose (only if you need it)
```bash
# Legacy standalone binary, not needed if you have the v2 plugin above
sudo apt install -y docker-compose
```

4) Allow your user to run docker without sudo
```bash
# Add your user to the docker group so docker commands don’t require sudo
sudo usermod -aG docker $USER

# Log out and back in (or reboot) so the new group membership takes effect
# After re-login, verify you can run docker without sudo
```

5) Enable and start the Docker service (if not already running)
```bash
# Ensure the daemon starts on boot and is running now
sudo systemctl enable --now docker
```

6) Verify Docker and Compose on Linux
```bash
# Confirm docker CLI is installed
docker --version

# Confirm the daemon is reachable (no sudo if you applied step 4 and re-logged)
docker info

# Prefer Compose v2 via docker compose; falls back to legacy if installed
docker compose version || docker-compose --version
```

## Running this project
```bash
# Navigate to the project’s docker folder
cd "docker-webserver"

# Run the setup script; it will:
# 1) wait for the Docker daemon
# 2) detect docker compose vs docker-compose
# 3) build and start both web servers
./install.sh

# Open the services in your browser
# Nginx (serves nginx/index.html)
# Apache (serves apache/index.html)
```

Nginx: http://localhost:8001

Apache: http://localhost:8002

## Troubleshooting
- If docker info fails: ensure Docker Desktop (macOS) or the docker service (Linux) is running.
- If permissions errors occur on Linux: confirm you re-logged after adding your user to the docker group.
- If ports 8001/8002 are in use: edit `docker-webserver/docker-compose.yml` and change the host ports to free ones.
- If the browser shows the default Nginx page: rebuild to ensure your custom index.html was copied.
```bash
# Force a clean rebuild and restart
docker compose build --no-cache | cat
docker compose up -d | cat

# Check Nginx container logs for any clues
docker compose logs nginx | cat
```

## What the install script does (summary)
- Verifies docker CLI exists and waits for the daemon.
- Chooses the compose command:
  - uses `docker compose` if available (Compose v2 plugin)
  - otherwise uses `docker-compose` if installed
- Builds and starts both services, then prints the URLs.
