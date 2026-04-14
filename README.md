
# Linux System Hardening & Security Audit Script

![Bash](https://img.shields.io/badge/Language-Bash-green.svg)
![Security](https://img.shields.io/badge/Focus-SecOps-blue.svg)
![Status](https://img.shields.io/badge/Status-Active-brightgreen.svg)

## 📌 Overview
This script is designed to automate initial security hardening for Linux servers (Ubuntu/Debian). It focuses on reducing the attack surface by auditing system vulnerabilities and enforcing essential security configurations.

## 🛡️ Key Features
- **User Audit:** Scans for non-standard users and checks for empty/weak passwords.
- **SSH Hardening:** Automates disabling of root login and enforces SSH Key authentication.
- **Firewall Control:** Configures `UFW` to restrict traffic to essential ports only (SSH, HTTP, HTTPS).
- **Service Management:** Identifies and disables unnecessary or risky background services.
- **System Updates:** Automates the fetching and installation of critical security patches.
- **Password Policy:** Implements stricter password complexity requirements.

## 🚀 How to Use
1. **Clone the repository:**
   ```bash
   git clone [https://github.com/Bekbolat-S/hardening-script.git](https://github.com/Bekbolat-S/hardening-script.git)
