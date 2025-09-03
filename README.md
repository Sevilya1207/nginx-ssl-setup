# 🚀 Nginx SSL Setup

A ready-to-use **Nginx + Let's Encrypt SSL setup** packaged with Docker.  
This project simplifies deploying a secure Nginx web server with **automatic HTTPS certificates**, **cron-based renewal**, and easy setup scripts.  

Perfect for freelancers, startups, and production-ready deployments.  

---

## 🔥 Features

- 🌍 Automatic HTTPS with **Let's Encrypt & Certbot**
- 🐳 **Dockerized Nginx** setup (easy to run & deploy)
- 🔐 **SSL auto-renewal** with `cron`
- ⚡ Redirects all HTTP traffic → HTTPS
- 📂 Preconfigured `nginx.conf` and `site.conf`
- 🛠️ Simple `setup_ssl.sh` script with DNS instructions
- 🚀 One-command startup with `run.sh`

---

## 🛠️ Tech Stack

- **Nginx** (web server)
- **Docker & Docker Compose**
- **Certbot** (Let's Encrypt SSL)
- **Debian Slim** (base image)
- **Cron** (auto SSL renewal)
- **Bash** (setup scripts)

---

## 📂 Repository Structure

```bash
.
├── compose.yml          # Docker Compose file
├── dockerfile           # Docker build instructions
├── nginx.conf           # Main Nginx config
├── site.conf            # Virtual host with SSL + redirect rules
├── site/                # Example static website
│   ├── favicon.ico
│   └── index.html
├── run.sh               # Startup script
├── setup_ssl.sh         # Interactive SSL setup with DNS check
├── renew-cert.sh        # Auto certificate renewal script
├── crontab.txt          # Cron job for auto-renewal
└── .gitignore           # Excludes certificates from Git
```

---

## ⚡ Getting Started

### 1️⃣ Clone Repository

```bash
git clone https://github.com/Sevilya1207/nginx-ssl-setup.git
cd nginx-ssl-setup
```

### 2️⃣ Run with Docker

```bash
./run.sh
```

- Starts Nginx in Docker
- Optionally runs Let's Encrypt SSL setup

### 3️⃣ Setup SSL (if not done in run.sh)

```bash
./setup_ssl.sh
```

Follow the prompts:

- Enter domain + email
- Configure DNS `A` record → server IP
- Certbot will issue SSL certificates

### 4️⃣ Renew Certificates Automatically

Certificates auto-renew daily at **04:00 AM** (via cron).  
You can also run manually:

```bash
./renew-cert.sh
```

---

## 📦 Deployment

Deploy on any server with **Docker + public IP + domain DNS A record**.

1. Point your domain (e.g. `example.com`) → server IP.  
2. Open ports `80` and `443`.  
3. Run:

   ```bash
   ./run.sh
   ```

4. Access your secure site at:  
   👉 `https://example.com`

---

## 📬 Contact

- 📧 Email: [suleko.dev@gmail.com](mailto:suleko.dev@gmail.com)  
- 💬 Telegram: [@sevilyakk](https://t.me/sevilyakk)  
- 👨‍💻 GitHub: [Sevilya1207](https://github.com/Sevilya1207)  

💼 Available for **freelance DevOps projects** on Upwork.

---

## 🌐 Portfolio

👉 **[https://me.zeroserv.top](https://me.zeroserv.top)** (custom domain)  
🔗 Mirror: [https://sevilya1207.github.io](https://sevilya1207.github.io)
