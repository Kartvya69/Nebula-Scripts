# Server Management Script

This script automates the installation of various server management panels and tools. It supports installations of Node.js, MCSManager, PufferPanel, Pterodactyl Panel & Node, Jexactyl, and a Ctrl Panel, with both Docker and manual installation options.

Table of Contents

1. Features


2. Requirements


3. Installation Instructions


4. Usage


5. Options Explained


6. License



Features

This script provides one-click installation for the following tools:

Node.js (using nvm or a manual installation)

MCSManager (a Minecraft server management panel)

PufferPanel (a game server management panel, with and without Docker support)

Pterodactyl Panel & Node (a powerful game server management panel)

Jexactyl (an open-source game server management tool)

Ctrl Panel (a generic control panel, customizable for any server management system)

Cancel/Abort Script (to stop the script at any point)


Requirements

Linux server (Ubuntu or Debian-based recommended)

Root or sudo privileges

curl, wget, git, and other common utilities


Installation Instructions

1. Download the script:

wget https://github.com/Kartvya69/Nebula-Scripts.git


2. Make the script executable:

chmod +x Nebulascript.sh


3. Run the script:

sudo ./nebulascript.sh or bash nebulascript.sh



Usage

Once the script is executed, it will present a menu of installation options. Choose the number corresponding to the tool you want to install by typing the number and pressing Enter.

Example:

Please select an option:
1) Install Node.js
2) Install McsManager
3) Install PufferPanel (Docker)
4) Install PufferPanel (without Docker)
5) Install Pterodactyl Panel
6) Install Pterodactyl Node
7) Cancel
8) Install Pterodactyl Panel without IPv4
9) Install Pterodactyl Node without IPv4
10) Install Jexactyl
11) Manual Installation of MCSManager
12) Install Ctrl Panel
13) Cancel & Abort Script

Select an option by entering the number corresponding to your desired action. Follow the on-screen prompts to complete the installation.

Options Explained

1. Install Node.js

Installs Node.js (v22) using nvm or manually (for a specific version).



2. Install McsManager

Installs MCSManager, a Minecraft server management panel.



3. Install PufferPanel (Docker)

Installs PufferPanel with Docker support for managing game servers.



4. Install PufferPanel (without Docker)

Installs PufferPanel without Docker support.



5. Install Pterodactyl Panel

Installs the Pterodactyl Panel, a popular game server management panel.



6. Install Pterodactyl Node

Installs Pterodactyl Node, a node that works with the Pterodactyl panel.



7. Cancel

Aborts the current operation and exits the script.



8. Install Pterodactyl Panel without IPv4

Installs the Pterodactyl Panel with an IPv6-only configuration.



9. Install Pterodactyl Node without IPv4

Installs Pterodactyl Node with an IPv6-only configuration.



10. Install Jexactyl

Installs Jexactyl, an open-source game server management tool.



11. Manual Installation of MCSManager

Manually installs MCSManager, a Minecraft server manager, using pre-defined steps and instructions.



12. Install Ctrl Panel

Installs a generic control panel (customizable for any server management system).



13. Cancel & Abort Script

Aborts the script entirely and exits.




License

This project is licensed under the MIT License - see the LICENSE file for details.
