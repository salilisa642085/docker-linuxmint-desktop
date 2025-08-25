# Linux Mint 22.1 XFCE Edition desktop in Docker
# Based on Ubuntu 24.04 (Noble Numbat)
FROM --platform=linux/amd64 ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"]

# Update and tools
RUN apt-get update -y && apt-get install -y --no-install-recommends \
    software-properties-common \
    sudo wget curl git vim net-tools xterm tzdata ca-certificates \
    dbus-x11 x11-utils x11-apps x11-xserver-utils \
    tigervnc-standalone-server novnc websockify \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Add Linux Mint repo for 22.1 "Wilma"
RUN add-apt-repository "deb http://packages.linuxmint.com wilma main upstream import backport" && \
    apt-get update -y

# Install XFCE DE + Mint theming
RUN apt-get install -y --no-install-recommends \
    xfce4 xfce4-goodies \
    mint-themes \
    mint-y-icons \
    mint-artwork \
    mint-info \
    lightdm \
    firefox \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Prep X11 for VNC
RUN touch /root/.Xauthority

# Expose VNC + noVNC
EXPOSE 5901
EXPOSE 6080

# Start XFCE desktop under VNC
CMD bash -c '\
    vncserver -localhost no -SecurityTypes None -geometry 1280x800 --I-KNOW-THIS-IS-INSECURE && \
    openssl req -new -subj "/C=JP" -x509 -days 365 -nodes -out self.pem -keyout self.pem && \
    websockify -D --web=/usr/share/novnc/ --cert=self.pem 6080 localhost:5901 && \
    tail -f /dev/null'
