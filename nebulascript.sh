#!/bin/bash

# Clear the console
clear

# Color codes for better visuals
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Log functions
log() {
    echo -e "${GREEN}[INFO] $(date +'%Y-%m-%d %H:%M:%S') - $1${NC}"
}

warn() {
    echo -e "${YELLOW}[WARN] $(date +'%Y-%m-%d %H:%M:%S') - $1${NC}"
}

error() {
    echo -e "${RED}[ERROR] $(date +'%Y-%m-%d %H:%M:%S') - $1${NC}"
}

# Function: Install Dependencies
install_dependencies() {
    log "Installing required dependencies..."
    sudo apt update && sudo apt upgrade -y
    sudo apt install -y curl wget git software-properties-common tar gzip unzip lsb-release
}

# Section 1: Install Node.js
install_nodejs() {
    log "Installing Node.js with nvm..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    nvm install 22
    node -v
    npm -v
    log "Node.js installation completed."
}

# Section 2: Install McsManager
install_mcsmanager() {
    log "Installing McsManager..."
    wget -qO- https://script.mcsmanager.com/setup.sh | bash
    log "McsManager installation completed."
}

# Section 3: Manual Install McsManager
manual_install_mcsmanager() {
    log "Starting manual installation of MCSManager..."
    mkdir -p /opt/mcsmanager
    cd /opt/mcsmanager
    wget https://github.com/MCSManager/MCSManager/releases/latest/download/mcsmanager_linux_release.tar.gz
    tar -zxf mcsmanager_linux_release.tar.gz
    ./install.sh
    log "MCSManager manual installation completed."
}

# Section 4: Install PufferPanel with Docker
install_pufferpanel_docker() {
    log "Installing PufferPanel with Docker..."
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
    mkdir -p /var/lib/pufferpanel
    docker volume create pufferpanel-config
    docker create --name pufferpanel -p 8080:8080 -p 5657:5657 \
        -v pufferpanel-config:/etc/pufferpanel \
        -v /var/lib/pufferpanel:/var/lib/pufferpanel \
        -v /var/run/docker.sock:/var/run/docker.sock \
        --restart=on-failure pufferpanel/pufferpanel:latest
    docker start pufferpanel
    log "PufferPanel with Docker installed."
}

# Section 5: Install Ctrl Panel
install_ctrl_panel() {
    log "Installing Ctrl Panel..."
    sudo apt update && sudo apt install -y apache2 mysql-server php php-fpm
    git clone https://github.com/your-ctrl-panel-repo.git /opt/ctrlpanel
    cd /opt/ctrlpanel
    ./install.sh
    log "Ctrl Panel installation completed."
}

# Section 6: Install Jexactyl
install_jexactyl() {
    log "Installing Jexactyl..."
    mkdir -p /var/www/jexactyl
    cd /var/www/jexactyl
    curl -Lo panel.tar.gz https://github.com/jexactyl/jexactyl/releases/latest/download/panel.tar.gz
    tar -xzvf panel.tar.gz
    chmod -R 755 storage/* bootstrap/cache/
    composer install --no-dev --optimize-autoloader
    cp .env.example .env
    php artisan key:generate
    log "Jexactyl installed. Please configure the panel in /var/www/jexactyl."
}

# Section 7: Install Pterodactyl Panel (Unofficial Script)
install_pterodactyl_panel_unofficial() {
    log "Installing Pterodactyl Panel with Unofficial Script..."
    bash <(curl -s https://raw.githubusercontent.com/vilhelmprytz/pterodactyl-installer/master/install-panel.sh)
    log "Pterodactyl Panel installed successfully."
}

# Section 8: Install Pterodactyl Node (Unofficial Script)
install_pterodactyl_node_unofficial() {
    log "Installing Pterodactyl Node (Wings) with Unofficial Script..."
    bash <(curl -s https://raw.githubusercontent.com/vilhelmprytz/pterodactyl-installer/master/install-wings.sh)
    log "Pterodactyl Node (Wings) installed successfully."
}

# Section 9: Install Pterodactyl Panel (No IPv4, Unofficial Script)
install_pterodactyl_panel_no_ipv4_unofficial() {
    log "Installing Pterodactyl Panel without IPv4 using Unofficial Script..."
    bash <(curl -s https://raw.githubusercontent.com/vilhelmprytz/pterodactyl-installer/master/install-panel.sh) \
        --disable-ipv4
    log "Pterodactyl Panel without IPv4 installed."
}

# Section 10: Install Pterodactyl Node (No IPv4, Unofficial Script)
install_pterodactyl_node_no_ipv4_unofficial() {
    log "Installing Pterodactyl Node without IPv4 using Unofficial Script..."
    bash <(curl -s https://raw.githubusercontent.com/vilhelmprytz/pterodactyl-installer/master/install-wings.sh) \
        --disable-ipv4
    log "Pterodactyl Node without IPv4 installed."
}

# Menu options
while true; do
    echo -e "\n${YELLOW}Please select an option:${NC}"
    echo "1) Install Node.js"
    echo "2) Install McsManager"
    echo "3) Manual Install McsManager"
    echo "4) Install PufferPanel with Docker"
    echo "5) Install Ctrl Panel"
    echo "6) Install Jexactyl"
    echo "7) Install Pterodactyl Panel (Unofficial Script)"
    echo "8) Install Pterodactyl Node (Unofficial Script)"
    echo "9) Install Pterodactyl Panel (No IPv4, Unofficial Script)"
    echo "10) Install Pterodactyl Node (No IPv4, Unofficial Script)"
    echo "11) Exit"
    read -p "Enter your choice [1-11]: " choice

    case $choice in
    1) install_nodejs ;;
    2) install_mcsmanager ;;
    3) manual_install_mcsmanager ;;
    4) install_pufferpanel_docker ;;
    5) install_ctrl_panel ;;
    6) install_jexactyl ;;
    7) install_pterodactyl_panel_unofficial ;;
    8) install_pterodactyl_node_unofficial ;;
    9) install_pterodactyl_panel_no_ipv4_unofficial ;;
    10) install_pterodactyl_node_no_ipv4_unofficial ;;
    11) log "Exiting script. Goodbye!"; exit 0 ;;
    *) error "Invalid choice. Please try again." ;;
    esac
done
