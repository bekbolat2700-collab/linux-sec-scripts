#!/bin/bash

# --- Конфигурация ---
LOG_FILE="/var/log/system_hardening.log"


echo "Starting system hardening..."
# Проверка и установка зависимостей
echo "Checking dependencies..."
for pkg in openssh-server ufw fail2ban; do
    if ! dpkg -l | grep -q $pkg; then
        echo "Installing $pkg..."
        sudo apt install -y $pkg
    fi
done
# 1. Update system
sudo apt-get update && sudo apt-get upgrade -y

# Функция логирования
log_message() {
    local MESSAGE="$1"
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $MESSAGE" | sudo tee -a "$LOG_FILE"
}

# --- 1. Проверка прав ROOT ---
if [[ $EUID -ne 0 ]]; then
   echo "Ошибка: запустите скрипт через sudo!"
   exit 1
fi
>>>>>>> c16c774 (feat: added enterprise logging, root check and fail2ban)

log_message " Начало настройки безопасности "

# --- 2. Обновление системы ---
log_message "Обновление пакетов..."
apt-get update -y && apt-get upgrade -y >> "$LOG_FILE" 2>&1

# --- 3. Настройка Firewall (UFW) ---
log_message "Настройка UFW..."
apt-get install -y ufw >> "$LOG_FILE" 2>&1
ufw default deny incoming
ufw default allow outgoing
ufw allow ssh
ufw --force enable
log_message "UFW настроен и включен."

# --- 4. Защита SSH ---
log_message "Защита SSH (запрет root login)..."
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config
systemctl restart ssh
log_message "SSH защищен."

# --- 5. Установка Fail2Ban ---
log_message "Установка Fail2Ban..."
apt-get install -y fail2ban >> "$LOG_FILE" 2>&1
systemctl enable fail2ban
systemctl start fail2ban
log_message "Fail2Ban установлен."

log_message " Hardening завершен успешно! "
