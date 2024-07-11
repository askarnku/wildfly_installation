#!/bin/bash

# Variables
WILDFLY_CONFIG_DIR="/etc/wildfly"
WILDFLY_SERVICE_FILE="/etc/systemd/system/wildfly.service"
WILDFLY_LAUNCH_SCRIPT="/opt/wildfly/bin/launch.sh"

# Function to stop and remove WildFly service
remove_wildfly_service() {
    if systemctl is-active --quiet wildfly.service; then
        sudo systemctl stop wildfly.service
        echo "WildFly service stopped."
    fi
    
    if systemctl is-enabled --quiet wildfly.service; then
        sudo systemctl disable wildfly.service
        echo "WildFly service disabled."
    fi
    
    if [ -f "$WILDFLY_SERVICE_FILE" ]; then
        sudo rm "$WILDFLY_SERVICE_FILE"
        echo "WildFly service file removed."
    fi
    
    if [ -d "$WILDFLY_CONFIG_DIR" ]; then
        sudo rm -rf "$WILDFLY_CONFIG_DIR"
        echo "WildFly config directory removed."
    fi
    
    if [ -f "$WILDFLY_LAUNCH_SCRIPT" ]; then
        sudo rm "$WILDFLY_LAUNCH_SCRIPT"
        echo "WildFly launch script removed."
    fi

    sudo systemctl daemon-reload
}

# Check and remove existing configurations
if [ -d "$WILDFLY_CONFIG_DIR" ] || [ -f "$WILDFLY_SERVICE_FILE" ] || [ -f "$WILDFLY_LAUNCH_SCRIPT" ]; then
    echo "Existing WildFly configurations found. Removing them."
    remove_wildfly_service
else
    echo "No existing WildFly configurations found. Proceeding with installation."
fi

# Create WildFly config directory
sudo mkdir -p /etc/wildfly

# Copy new configuration files
sudo cp wildfly.conf /etc/wildfly/
sudo cp wildfly.service /etc/systemd/system/
sudo cp launch.sh /opt/wildfly/bin/
sudo chmod +x /opt/wildfly/bin/launch.sh

# Reload systemd manager configuration
sudo systemctl daemon-reload

# Enable and start WildFly service
sudo systemctl enable wildfly.service
sudo systemctl start wildfly.service

echo "WildFly configuration and service installation completed."
