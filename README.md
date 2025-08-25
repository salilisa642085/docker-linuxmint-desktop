# 🍃 Linux Mint 22.1 Desktop in Docker (Cinnamon & XFCE Editions)

Run a **Linux Mint 22.1 (Wilma)** desktop inside Docker with **VNC** and **noVNC (browser access)**.  
This project lets you pick between the **authentic full Cinnamon Edition** 🖥️ or a **lightweight XFCE Edition** ⚡ — both accessible remotely!  

---

## ✨ Features
- Full **Linux Mint 22.1 desktop environments** inside Docker  
- Two editions provided:
  - 🖥️ **Cinnamon Edition** → Authentic Mint Cinnamon desktop (default Mint flavor)  
  - ⚡ **XFCE Edition** → Lightweight XFCE with Mint-Y themes/icons  
- **Access methods:**
  - VNC clients (`5901` Cinnamon, `5902` XFCE)  
  - noVNC for browsers (`6080` Cinnamon, `6081` XFCE)  
- Linux Mint look and feel with **Mint-Y themes, icons & wallpapers**  
- Firefox preinstalled  
- Useful tools (vim, git, curl, wget, etc.) included  
- Self-contained using Docker Compose  

---

## 📦 Build the Images

Clone this repository:

```bash
git clone https://github.com/YOUR_USERNAME/docker-linuxmint-desktop.git
cd docker-linuxmint-desktop
```

Build either Cinnamon or XFCE manually:

```bash
# Build Cinnamon Edition
docker build -t mint-cinnamon -f Dockerfile.cinnamon .

# Build XFCE Edition
docker build -t mint-xfce -f Dockerfile.xfce .
```

---

## 🚀 Run with Docker

Run Cinnamon:
```bash
docker run -it -p 5901:5901 -p 6080:6080 --name mint-cinnamon mint-cinnamon
```

Run XFCE:
```bash
docker run -it -p 5902:5901 -p 6081:6080 --name mint-xfce mint-xfce
```

Then access them:

- Cinnamon → <http://localhost:6080>  
- XFCE → <http://localhost:6081>  

---

## ⚡ Quick Start with Docker Compose

Run **both Cinnamon & XFCE at once** with a single command:

```bash
docker compose up -d
```

- Cinnamon:  
  - Browser → <http://localhost:6080>  
  - VNC → `localhost:5901`

- XFCE:  
  - Browser → <http://localhost:6081>  
  - VNC → `localhost:5902`

Stop everything:
```bash
docker compose down
```

---

## 📂 Project Layout

```
.
├── Dockerfile.cinnamon   # Full Cinnamon Edition desktop
├── Dockerfile.xfce       # Lightweight XFCE Edition desktop
├── docker-compose.yml    # One-click startup for both editions
├── README.md             # Documentation (this file)
└── screenshot.png        # Example screenshot (Cinnamon shown)
```

---

## 🍃 Example Screenshot

<p align="center">
  <img src="screenshot.png" alt="Linux Mint 22.1 Cinnamon Desktop in Docker" width="800"/><br/>
  <em>Linux Mint 22.1 Cinnamon desktop running inside Docker, accessible via noVNC.</em>
</p>

---

## ⚠️ Security Notice

This setup currently uses:  
- **No VNC password** (`--I-KNOW-THIS-IS-INSECURE`)  
- **Self-signed TLS certificate** for noVNC  

It is intended for **local labs, development, or testing**.  
If deploying remotely:  
- Set a password for VNC (`vncpasswd`)  
- Use production HTTPS certificates (e.g. via Nginx/Let’s Encrypt)  
- Protect ports behind a firewall, VPN, or reverse proxy  

---

## 🛠️ Troubleshooting

- **Blank VNC screen** → Ensure `cinnamon-core` or `xfce4` is installed correctly, and session startup is pointing to the correct DE.  
- **Port conflicts** → Adjust `-p` mappings in `docker run` or `docker-compose.yml`.  
- **High resource usage** → Cinnamon is heavier; XFCE is recommended for lightweight use.  
- **Missing packages** → Inside the container, run `apt-get update` and re-install.  

---

## 📜 License
This project is provided under the **MIT License**.  
Linux Mint is a trademark of **Clement Lefebvre & The Linux Mint Team**.  
This repo simply provides Dockerized environments of Mint for testing and convenience.  
