
# Automated Server Panel Installer

This script simplifies the installation of popular server management panels like **McsManager**, **PufferPanel**, **Ctrl Panel**, **Pterodactyl**, and more. It supports both Docker and non-Docker setups with dynamic environment checks and robust error handling.

---

## Features
- Install Node.js using NVM.
- Automatic and manual installations for McsManager.
- Install PufferPanel with and without Docker.
- Simplified setup for Ctrl Panel, Jexactyl, and Pterodactyl (both official and unofficial methods).
- Error handling, user prompts, and progress feedback.

---

## Prerequisites
Ensure your system has:
- **Debian/Ubuntu-based OS** (e.g., Ubuntu 20.04+ or Debian 10+).
- Root or sudo access.

The script will check for and install these dependencies:
- `curl`, `wget`, `git`, `tar`, `unzip`, and `npm`.

---

## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/Kartvya69/Nebula-Scripts.git
   cd Nebula-Scripts

2. Make the script executable:

chmod +x installer.sh


3. Run the script:

./installer.sh




---

Usage

The script provides a menu-driven interface:

1. Select the desired installation option:

Node.js: Sets up NVM and installs Node.js 22.

McsManager: Choose between automated or manual installation.

PufferPanel: Install with or without Docker.

Ctrl Panel: Includes fixes for common issues.

Jexactyl: Installs the panel with optimizations.

Pterodactyl: Offers both official and unofficial methods.



2. Follow the on-screen instructions for each selection.




---

Panels Covered

1. Node.js: Base dependency setup.


2. McsManager:

Automatic installation with dependencies.

Manual installation for custom setups.



3. PufferPanel:

With Docker.

Without Docker for non-containerized environments.



4. Ctrl Panel: Fixes applied for a smooth setup.


5. Jexactyl: Fully optimized installation process.


6. Pterodactyl:

Official panel and node setups.

Unofficial scripts for simplified installation.





---

License

This project is licensed under the MIT License. See the LICENSE file for details.


---

Contribution

Feel free to open issues or submit pull requests for improvements. Collaboration is welcome!


---

Troubleshooting

If you encounter any errors:

1. Check the terminal logs for details.


2. Ensure all dependencies are installed correctly.


3. Reach out for support or open an issue in this repository.
