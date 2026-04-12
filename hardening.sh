#!/bin/bash

# Simple Linux Security Hardening Script
# Author: Bekbolat
# Purpose: Basic system hardening for DevOps/SecOps projects

echo "Starting system hardening..."

# 1. Update system
sudo apt-get update && sudo apt-get upgrade -y

# 2. Configure SSH (Disable Root Login)
echo "Hardening SSH configuration..."
sudo sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
sudo systemctl restart ssh

# 3. Setup UFW Firewall
echo "Configuring Firewall..."
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
echo "y" | sudo ufw enable

# 4. Install and configure Fail2Ban
echo "Installing Fail2Ban..."
sudo apt-get install fail2ban -y
sudo systemctl enable fail2ban
sudo systemctl start fail2ban

echo "Hardening complete! System is now more secure."
