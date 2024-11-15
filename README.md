# VPS Installation Script
This script automates the installation of several popular server management panels and tools on a VPS. It can install:

Node.js (via nvm and fnm)
McsManager
PufferPanel (both with and without Docker)
Skyport Panel
Skyportd Node (with PM2 daemon)
Prerequisites
Before running the script, ensure your system meets the following requirements:

A Linux-based VPS (Ubuntu recommended)
Root/Sudo privileges on the VPS
Internet access to download required packages and dependencies
A modern version of bash, which is typically pre-installed on most Linux systems
Supported Platforms
Ubuntu (Debian-based distributions)
Any VPS with IPv6 support (you do not need an IPv4 address or domain)
Features
Automated installation for popular panels like McsManager and PufferPanel.
Docker integration for PufferPanel, with automatic setup.
Option to install Skyport Panel and Skyportd Node.
Logging of all installation steps for troubleshooting.
Checks and installs necessary dependencies like curl, wget, and docker.
Installation Guide
Step 1: Prepare the VPS
Login to your VPS using SSH:

bash
Copy code
ssh user@your-vps-ip
Update your package lists (recommended to ensure all installed software is up to date):

bash
Copy code
sudo apt update
Step 2: Download the Script
You can download the script directly to your VPS using wget or curl.

Using wget:
bash
Copy code
wget https://github.com/Kartvya69/Nebula-Scripts.git
Using curl:
bash
Copy code
curl -o https://github.com/Kartvya69/Nebula-Scripts.git
Step 3: Make the Script Executable
After downloading the script, you need to make it executable.

bash
Copy code
chmod +x install.sh
Step 4: Run the Script
Now you can run the script with the following command:

bash
Copy code
./install.sh
The script will display a menu with the following options:

Install Node.js
Install McsManager
Install PufferPanel (with Docker)
Install PufferPanel (without Docker)
Install Skyport Panel
Install Skyportd Node
Cancel
Simply enter the number corresponding to the tool you want to install and follow the on-screen instructions.

Step 5: Post-Installation Access
After installation completes, each tool will display access information, such as:

PufferPanel will be available at http://localhost:8080
Skyport Panel will be available once it finishes setting up
Any other relevant services will provide you with their local access URLs
Optional Step: Configure Your VPS for IPv6
If you're not using an IPv4 address and your VPS is configured for IPv6, you can access your services using the VPS's IPv6 address instead of localhost. You can find your VPS's IPv6 address with:

bash
Copy code
ip -6 addr show
Then replace localhost with your IPv6 address in the access URLs.

Uninstall Instructions
To remove any installed tool, follow the instructions specific to each tool. For example, to uninstall PufferPanel, you can stop and remove the Docker container:

bash
Copy code
docker stop pufferpanel
docker rm pufferpanel
To uninstall Node.js, simply remove nvm and the installed versions:

bash
Copy code
nvm uninstall 22
rm -rf ~/.nvm
Refer to each tool's documentation for more detailed uninstall steps.

Troubleshooting
If you encounter any issues during installation, check the logs printed by the script for any errors. Logs will include messages like "curl not found" or "docker installation failed" that may indicate missing dependencies.

Common Issues
Docker installation failure: Ensure your VPS supports Docker (if you're installing PufferPanel with Docker).
Permission issues: Make sure you're running the script with sudo privileges, especially when installing system-wide tools like Docker.
Dependency errors: If any package is missing (e.g., curl, wget), the script will attempt to install it.
License
This script is licensed under the MIT License.

How to use this:
Copy the above content.
Create a new file called README.md in your project folder (where your script is located).
Paste the copied content into that README.md file.
Save the file.
You can now use this README.md alongside your script for user instructions, installation, and troubleshooting. Let me know if you need any further changes or additions!



You said:
Make Them in one I want to copy & direct paste on the readme
ChatGPT said:
ChatGPT
Got it! Here’s the complete README.md with the script and instructions all in one document. You can copy this entire block and paste it directly into your README.md file.

markdown
Copy code
# VPS Installation Script

This script automates the installation of several popular server management panels and tools on a VPS. It can install:

- **Node.js** (via `nvm` and `fnm`)
- **McsManager**
- **PufferPanel** (both with and without Docker)
- **Skyport Panel**
- **Skyportd Node** (with PM2 daemon)

### Prerequisites

Before running the script, ensure your system meets the following requirements:

- A **Linux-based VPS** (Ubuntu recommended)
- **Root/Sudo privileges** on the VPS
- **Internet access** to download required packages and dependencies
- A **modern version of `bash`**, which is typically pre-installed on most Linux systems

### Supported Platforms

- Ubuntu (Debian-based distributions)
- Any VPS with **IPv6** support (you do not need an IPv4 address or domain)

### Features

- **Automated installation** for popular panels like McsManager and PufferPanel.
- **Docker integration** for PufferPanel, with automatic setup.
- Option to install **Skyport Panel** and **Skyportd Node**.
- **Logging** of all installation steps for troubleshooting.
- Checks and installs necessary dependencies like `curl`, `wget`, and `docker`.

---

## Installation Guide

### Step 1: Prepare the VPS

1. **Login** to your VPS using SSH:
   ```bash
   ssh user@your-vps-ip
Update your package lists (recommended to ensure all installed software is up to date):
bash
Copy code
sudo apt update
Step 2: Download the Script
You can download the script directly to your VPS using wget or curl.

Using wget:
bash
Copy code
wget https://your-repository-url/vps-install-script.sh -O install.sh
Using curl:
bash
Copy code
curl -o install.sh https://your-repository-url/vps-install-script.sh
Step 3: Make the Script Executable
After downloading the script, you need to make it executable.

bash
Copy code
chmod +x install.sh
Step 4: Run the Script
Now you can run the script with the following command:

bash
Copy code
./install.sh
The script will display a menu with the following options:

Install Node.js
Install McsManager
Install PufferPanel (with Docker)
Install PufferPanel (without Docker)
Install Skyport Panel
Install Skyportd Node
Cancel
Simply enter the number corresponding to the tool you want to install and follow the on-screen instructions.

Step 5: Post-Installation Access
After installation completes, each tool will display access information, such as:

PufferPanel will be available at http://localhost:8080
Skyport Panel will be available once it finishes setting up
Any other relevant services will provide you with their local access URLs
Optional Step: Configure Your VPS for IPv6
If you're not using an IPv4 address and your VPS is configured for IPv6, you can access your services using the VPS's IPv6 address instead of localhost. You can find your VPS's IPv6 address with:

bash
Copy code
ip -6 addr show
Then replace localhost with your IPv6 address in the access URLs.

# Uninstall Instructions
To remove any installed tool, follow the instructions specific to each tool. For example, to uninstall PufferPanel, you can stop and remove the Docker container:

bash
Copy code
docker stop pufferpanel
docker rm pufferpanel
To uninstall Node.js, simply remove nvm and the installed versions:

bash
Copy code
nvm uninstall 22
rm -rf ~/.nvm
Refer to each tool's documentation for more detailed uninstall steps.

# Troubleshooting
If you encounter any issues during installation, check the logs printed by the script for any errors. Logs will include messages like "curl not found" or "docker installation failed" that may indicate missing dependencies.

# Common Issues
Docker installation failure: Ensure your VPS supports Docker (if you're installing PufferPanel with Docker).
Permission issues: Make sure you're running the script with sudo privileges, especially when installing system-wide tools like Docker.
Dependency errors: If any package is missing (e.g., curl, wget), the script will attempt to install it.
# License
This script is licensed under the MIT License.
