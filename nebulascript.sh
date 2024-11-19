#!/bin/bash

# Clear the console
clear

# Log function for better tracking
log() {
    echo "[INFO] $(date +'%Y-%m-%d %H:%M:%S') - $1"
}

# Function to install Node.js using nvm
install_nodejs() {
    log "Installing Node.js with nvm..."
    
    if ! command -v curl &> /dev/null; then
        log "curl not found. Installing curl..."
        sudo apt update && sudo apt install -y curl
    fi
    
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
    export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion  # Ensure nvm is available
    
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

# Function to manually install MCSManager
manual_install_mcsmanager() {
    log "Starting manual installation of MCSManager..."
    
    # Create /opt directory and switch to it
    mkdir -p /opt
    cd /opt/
    
    # Download and set up Node.js 20.11
    log "Downloading Node.js 20.11..."
    wget https://nodejs.org/dist/v20.11.0/node-v20.11.0-linux-x64.tar.xz
    tar -xvf node-v20.11.0-linux-x64.tar.xz
    sudo ln -s /opt/node-v20.11.0-linux-x64/bin/node /usr/bin/node
    sudo ln -s /opt/node-v20.11.0-linux-x64/bin/npm /usr/bin/npm
    
    # Prepare MCSManager directory and download the release
    mkdir -p /opt/mcsmanager/
    cd /opt/mcsmanager/
    log "Downloading MCSManager..."
    wget https://github.com/MCSManager/MCSManager/releases/latest/download/mcsmanager_linux_release.tar.gz
    tar -zxf mcsmanager_linux_release.tar.gz
    
    # Install dependencies and provide instructions for starting MCSManager
    ./install.sh
    log "MCSManager installed. Use the following commands to start:"
    log "1) Open a terminal and run: ./start-daemon.sh"
    log "2) Open another terminal and run: ./start-web.sh"
    log "Access the web interface at: http://localhost:23333/"
}

# Function to install PufferPanel with Docker
install_pufferpanel_docker() {
    log "Installing PufferPanel with Docker..."
    
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

# Additional functions omitted for brevity...

# Function to install Ctrl Panel (Generic Control Panel Installation)
install_ctrl_panel() {
    log "Installing Ctrl Panel..."
    
    # Example: Generic control panel installation (adjust as needed for your specific control panel)
    
    # Update and install required packages (assuming apt-based distros)
    sudo apt update && sudo apt install -y apache2 mysql-server php php-fpm
    
    # Clone the control panel repository (example GitHub repo)
    git clone https://github.com/your-ctrl-panel-repo.git /opt/ctrlpanel
    
    # Configure the panel (adjust the installation steps as needed for your panel)
    cd /opt/ctrlpanel
    sudo ./install.sh
    
    log "Ctrl Panel installation completed. Access the panel at http://localhost"
}

# Menu options
echo "Please select an option:"
echo "1) Install Node.js"
echo "2) Install McsManager"
echo "3) Install PufferPanel (Docker)"
echo "4) Install PufferPanel (without Docker)"
echo "5) Install Pterodactyl Panel"
echo "6) Install Pterodactyl Node"
echo "7) Cancel"
echo "8) Install Pterodactyl Panel without IPv4"
echo "9) Install Pterodactyl Node without IPv4"
echo "10) Install Jexactyl"
echo "11) Manual Installation of MCSManager"
echo "12) Install Ctrl Panel"
echo "13) Cancel & Abort Script"

# Read user choice
read -p "Enter your choice [1-13]: " choice

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
        install_pterodactyl_panel
        ;;
    6)
        install_pterodactyl_node
        ;;
    7)
        log "Operation cancelled."
        ;;
    8)
        install_pterodactyl_panel_no_ipv4
        ;;
    9)
        install_pterodactyl_node_no_ipv4
        ;;
    10)
        install_jexactyl
        ;;
    11)
        manual_install_mcsmanager
        ;;
    12)
        install_ctrl_panel
        ;;
    13)
        log "Script aborted."
        exit 0
        ;;
    *)
        log "Invalid choice, please try again."
        ;;
esac
