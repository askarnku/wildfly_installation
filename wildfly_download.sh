#!/bin/bash

# Variables
DOWNLOAD_LOCATION="/tmp"
WILDFLY_URL="https://download.jboss.org/wildfly/14.0.0.Final/wildfly-14.0.0.Final.tar.gz"
TAR_FILE="wildfly-14.0.0.Final.tar.gz"
MV_LOCATION="/opt"
OLD_NAME="wildfly-14.0.0.Final"
NEW_NAME="wildfly"
TMP_FILE="/tmp/wildfly*"
OPT_FILE="$MV_LOCATION/wildfly*"

sudo groupadd -r wildfly
sudo useradd -r -g wildfly -d /opt/wildfly -s /sbin/nologin wildfly

# Check if the all occurnces of wildfly* (dir or tar) exists in /tmp 
# Deletes they exist
if ls $TMP_FILE 1> /dev/null 2>&1; then
    sudo rm -rf $TMP_FILE
    echo "File(s) $TMP_FILE deleted successfully."
else
    echo "File(s) $TMP_FILE does not exist."
fi

# Check if the folder exists in /opt and delete it if it does
if ls $OPT_FILE 1> /dev/null 2>&1; then
    sudo rm -rf $OPT_FILE
    echo "Folder(s) $OPT_FILE deleted successfully."
else
    echo "Folder(s) $OPT_FILE does not exist."
fi

# Change to download location
cd $DOWNLOAD_LOCATION

# Download WildFly
sudo wget $WILDFLY_URL

# Extract WildFly into /opt
sudo tar -xvf "$TAR_FILE" -C "$MV_LOCATION"

# Rename extracted folder
cd $MV_LOCATION
sudo mv "$OLD_NAME" "$NEW_NAME"

# Change ownership of /opt/wildfly to user: wildfly
sudo chown -R wildfly:wildfly /opt/wildfly/
