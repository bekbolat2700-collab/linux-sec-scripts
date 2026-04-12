# Linux Security Scripts
A collection of scripts to automate system hardening and security monitoring.

## 🛡️ Hardening Script
`hardening.sh` automates basic security tasks:
* Disables SSH root login
* Configures UFW firewall (allows only 80, 443, SSH)
* Installs and sets up Fail2Ban
* Updates system packages

## How to use
chmod +x hardening.sh
sudo ./hardening.sh
