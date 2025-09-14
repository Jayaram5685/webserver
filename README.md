# 🌐 Docker Webserver Project  

![Docker](https://img.shields.io/badge/Docker-Ready-blue?logo=docker)  
![Apache](https://img.shields.io/badge/Apache-Server-red?logo=apache)  
![Nginx](https://img.shields.io/badge/Nginx-Server-green?logo=nginx)  
![Made with Bash](https://img.shields.io/badge/Made%20with-Bash-black?logo=gnu-bash)  
![License](https://img.shields.io/badge/License-MIT-yellow)  

This project demonstrates how to run **Apache** and **Nginx** web servers using **Docker Compose**.  
It provides a **ready-to-use local webserver environment** for developers, learners, and DevOps enthusiasts 🚀.  

---

## 📂 Project Structure  

docker-webserver/
├── apache/ # Apache server files (index.html etc.)
├── nginx/ # Nginx server files (index.html etc.)
├── docker-compose.yml # Docker Compose configuration
├── install.sh # Installation script
├── open-web.sh # Script to open servers in browser
└── screenshots/ # Screenshots (apache, nginx, terminal)



---

## ⚙️ Installation & Setup  

### 🔹 Prerequisites  
- Install [Docker](https://docs.docker.com/get-docker/) 🐳  
- Install [Docker Compose](https://docs.docker.com/compose/)  

### 🔹 Steps  

1️⃣ Clone the repository:  
```bash
git clone https://github.com/Jayaram5685/webserver.git
cd webserver/docker-webserver

2️⃣ Make scripts executable:
chmod +x install.sh open-web.sh

3️⃣ Run installation:
./install.sh

4️⃣ Start web servers with Docker Compose:
docker-compose up -d

5️⃣ Open servers in browser automatically:
./open-web.sh


Apache Server → http://localhost:8080
Nginx Server → http://localhost:8081

📸 Screenshots

✅ Apache Server

✅ Nginx Server

✅ Terminal Running

🌍 Real-World Use Cases
✔️ Developers – Run & test multiple web servers locally.
✔️ Students – Learn the differences between Apache and Nginx with hands-on practice.
✔️ DevOps Engineers – Practice container orchestration using Docker & Compose.
✔️ Deployment Simulation – Mimic production environments by running different servers simultaneously.
✔️ Extendable Setup – Add databases (MySQL/Postgres) or APIs and build a full-stack environment.

📖 Example Scenario
Imagine you’re working in a startup where some projects run on Apache while others prefer Nginx for performance.
👉 Instead of setting up separate servers manually, you spin them up using Docker Compose in seconds.
👉 You test how both servers handle requests and decide which one is better for your production use case.
👉 Tomorrow, if you need to integrate a database, you just add it to docker-compose.yml – no headaches! 🚀

🛠️ Future Enhancements
 Add MySQL / PostgreSQL support

 Integrate PHP / Node.js apps for real projects

 Add reverse proxy with Nginx

 Deploy setup to AWS / Azure / GCP

👨‍💻 Author
Jayaram
📌 B.Tech CSE | Full Stack Developer | DevOps & Cloud Enthusiast
🔗 GitHub

⭐ If you like this project, don’t forget to star the repo on GitHub!


---
