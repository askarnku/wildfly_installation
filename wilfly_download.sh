#!/bin/bash


#Variables
DOWNLOAD_LOCATION="/tmp"
WILDFLY_URL="https://download.jboss.org/wildfly/14.0.0.Final/wildfly-14.0.0.Final.tar.gz"
TAR_FILE="wildfly-14.0.0.Final.tar.gz"
MV_LOCATION="/opt"
OLD_NAME="wildfly-14.0.0.Final"
NEW_NAME="wildfly"




# Path to the file
FILE="/tmp/wildfly*"

# Check if the file exists
if [ -f "$FILE" ]; then
    # If it exists, delete the file
    sudo rm "$FILE"
    # Output success message
    echo "File $FILE deleted successfully."
else
    # Output message if file does not exist
    echo "File $FILE does not exist."
fi


#Downloads and extracts wildfly

# Download wildfly into /tmp
cd $DOWNLOAD_LOCATION
sudo wget $WILDFLY_URL

#extract wilfly into /opt
sudo tar -xvf "$TAR_FILE" -C "$MV_LOCATION"

#rename wildfly-14.0.1.Final.tar.gz to as
cd $MV_LOCATION
sudo "$OLD_NAME" "$NEW_NAME"

# Add wildfly user and change ownership of /opt/wildfly to user: wildfly
sudo adduser -r wildfly
sudo chown -R wildfly:wildfly /opt/wildfly/

#chekc it





