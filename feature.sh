#!/bin/bash

# Clear the console
clear

# Log function for better tracking
log() {
    echo "[INFO] $(date +'%Y-%m-%d %H:%M:%S') - $1"
}

# Function to install Node.js using fnm
install_nodejs() {
    log "Installing Node.js with fnm..."
    
    if ! command -v curl &> /dev/null; then
        log "curl not found. Installing curl..."
        sudo apt update && sudo apt install -y curl
    fi
    
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
    source ~/.bashrc  # Ensure nvm is available
    
    nvm install 22
    node -v
    npm -v
    log "Node.js installation completed."
}

# Function to install McsManager
install_mcsmanager() {
    log "Installing McsManager..."
    
    if ! command -v wget &> /dev/null; then
        log "wget not found. Installing wget..."
        sudo apt update && sudo apt install -y wget
    fi
    
    wget -qO- https://script.mcsmanager.com/setup.sh | bash
    log "McsManager installation completed."
}

# Function to install PufferPanel with Docker
install_pufferpanel_docker() {
    log "Installing PufferPanel with Docker..."
    
    # Install Docker if not present
    if ! command -v docker &> /dev/null; then
        log "Docker not found. Installing Docker..."
        curl -fsSL https://get.docker.com -o get-docker.sh
        sudo sh get-docker.sh
        rm get-docker.sh
    fi
    
    mkdir -p /var/lib/pufferpanel
    docker volume create pufferpanel-config
    
    # Create and start PufferPanel container
    docker create --name pufferpanel -p 8080:8080 -p 5657:5657 \
        -v pufferpanel-config:/etc/pufferpanel \
        -v /var/lib/pufferpanel:/var/lib/pufferpanel \
        -v /var/run/docker.sock:/var/run/docker.sock \
        --restart=on-failure pufferpanel/pufferpanel:latest
    
    docker start pufferpanel
    docker exec -it pufferpanel /pufferpanel/pufferpanel user add
    log "PufferPanel installation with Docker completed. Access it at http://localhost:8080"
}

# Function to install PufferPanel without Docker
install_pufferpanel_no_docker() {
    log "Installing PufferPanel without Docker..."
    
    curl -s https://repo.pufferpanel.com/ubuntu/pp.key | sudo apt-key add -
    echo "deb https://repo.pufferpanel.com/ubuntu/ $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/pufferpanel.list
    sudo apt update
    sudo apt install -y pufferpanel
    sudo systemctl enable pufferpanel
    sudo systemctl start pufferpanel
    
    log "PufferPanel installation without Docker completed. Access it at http://localhost:8080"
}

# Function to install Skyport Panel
install_skyport_panel() {
    log "Installing Skyport Panel..."
    
    cd /etc
    if [ ! -d "skyport" ]; then
        git clone https://github.com/skyportlabs/panel skyport
    fi
    
    cd skyport
    npm install
    log "Skyport Panel installation completed. Skyport Panel is now running."
}

# Function to install Skyportd Node with PM2 daemon
install_skyportd_node() {
    log "Installing Skyportd Node..."
    
    cd /etc
    if [ ! -d "skyportd" ]; then
        sudo git clone --branch v0.2.2 https://github.com/skyportlabs/skyportd
    fi
    
    cd skyportd
    sudo npm install

    # Start Skyportd with Node.js
    sudo node .
    
    # Install PM2 globally if not installed
    if ! command -v pm2 &> /dev/null; then
        log "PM2 not found. Installing PM2..."
        sudo npm install pm2@latest -g
    fi
    
    # Start Skyportd as a daemon using PM2
    sudo pm2 start index.js --name skyportd
    sudo pm2 save
    
    log "Skyportd Node installation completed and is running as a daemon using PM2."
}

# Menu options
echo "Please select an option:"
echo "1) Install Node.js"
echo "2) Install McsManager"
echo "3) Install PufferPanel (Docker)"
echo "4) Install PufferPanel (without Docker)"
echo "5) Install Skyport Panel"
echo "6) Install Skyportd Node"
echo "7) Cancel"

# Read user choice
read -p "Enter your choice [1-7]: " choice

# Handle user choice
case $choice in
    1)
        install_nodejs
        ;;
    2)
        install_mcsmanager
        ;;
    3)
        install_pufferpanel_docker
        ;;
    4)
        install_pufferpanel_no_docker
        ;;
    5)
        install_skyport_panel
        ;;
    6)
        install_skyportd_node
        ;;
    7)
        log "Operation cancelled."
        ;;
    *)
        log "Invalid choice, please try again."
        ;;
esac
