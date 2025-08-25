Perfect 🍃🐉 —  so it clearly offers **two editions** of Linux Mint inside Docker:  

1. **Cinnamon Edition** (full Mint desktop, authentic but heavier)  
2. **XFCE Edition** (lightweight, faster build, smaller footprint, but still themed Mint style)  

This way users can pick the flavor they prefer.  


# 🍃 Linux Mint 22.1 Desktop in Docker (with VNC + noVNC)

Run a **Linux Mint 22.1 (Wilma)** desktop inside Docker with **VNC** and **noVNC (browser access)**.  
This setup provides a **full Mint Cinnamon desktop** (default) OR a lightweight **Mint XFCE edition** — both accessible remotely! 🚀  

---

## ✨ Features
- Full **Linux Mint 22.1 desktop experience** inside Docker  
- Two editions available:
  - 🖥️ **Cinnamon Edition** → Authentic Mint look (default Mint flavor)  
  - ⚡ **XFCE Edition** → Lightweight desktop with Mint themes and Mint‑Y icons  
- Access via:
  - **VNC client** (port `5901`)  
  - **noVNC web browser** (port `6080`)  
- **Mint themes, icons, wallpapers** pre‑included  
- Firefox ESR + utilities (`git`, `vim`, `curl`, etc.)  

---

## 📦 Build the Image

Clone the repo and build the image:

```bash
git clone https://github.com/YOUR_USERNAME/docker-linuxmint-desktop.git
cd docker-linuxmint-desktop
```

---

### 🖥️ Cinnamon Edition (default Mint look)
```bash
docker build -t mint-cinnamon -f Dockerfile.cinnamon .
```

### ⚡ XFCE Edition (light but Mint‑themed)
```bash
docker build -t mint-xfce -f Dockerfile.xfce .
```

---

## 🚀 Run the Container

**Run Cinnamon edition**  
```bash
docker run -it -p 5901:5901 -p 6080:6080 --name mint-cinnamon mint-cinnamon
```

**Run XFCE edition**  
```bash
docker run -it -p 5902:5901 -p 6081:6080 --name mint-xfce mint-xfce
```

---

## 🖥️ Access the Mint Desktop

- **NoVNC (browser):**  
  ```
  http://localhost:6080   # Cinnamon
  http://localhost:6081   # XFCE
  ```

- **VNC Client:**  
  ```
  localhost:5901   # Cinnamon
  localhost:5902   # XFCE
  ```

---

## 📂 Project Layout
```
.
├── Dockerfile.cinnamon   # Mint Cinnamon desktop in Docker
├── Dockerfile.xfce       # Mint XFCE desktop in Docker
├── README.md             # Documentation (this file)
└── screenshot.png        # Example screenshot of Mint desktop
```

---

## ⚠️ Security Notice
Currently configured with:
- **No VNC password** (`--I-KNOW-THIS-IS-INSECURE`)  
- **Self‑signed TLS cert** for noVNC  

👉 Use this for **local labs/testing** only.  
For remote use, enable VNC password, real certificates, and secure access via reverse proxy or VPN.  

---

## 🍃 Example Screenshot

<p align="center">
  <img src="screenshot.png" alt="Linux Mint 22.1 Cinnamon Desktop" width="800"/><br/>
  <em>This is Linux Mint 22.1 Cinnamon running inside Docker, accessible via noVNC.</em>
</p>

---

## 🛠️ Troubleshooting

- **Package not found** → Run `apt-get update` inside the container, then try again.  
- **Blank VNC screen** → Make sure Cinnamon (`cinnamon-core`) or XFCE (`xfce4`) is installed and session starts correctly.  
- **High CPU usage** → Disable extra effects under Mint settings.  
- **Port collisions** → Adjust `-p` mappings when running multiple editions.  

---

## 📜 License
This project is provided under the **MIT License**.  
Linux Mint is © by **Clement Lefebvre & The Linux Mint Team**.  
This repo provides Dockerized environments for convenience only.  

✅ This way, your GitHub shows **two parallel builds (Cinnamon + XFCE)**, and users know exactly how to build and run the one they prefer.  
