#!/bin/bash

# Path to the file
FILE="/tmp/wildfly-32.0.1.Final.tar.gz"

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
cd /tmp
sudo wget https://github.com/wildfly/wildfly/releases/download/32.0.1.Final/wildfly-32.0.1.Final.tar.gz

#extract wilfly into /opt
sudo tar -xvf wildfly-32.0.1.Final.tar.gz -C /opt/

#rename wildfly-14.0.1.Final.tar.gz to as
cd /opt
sudo mv wildfly-32.0.1.Final/ wildfly

# Add wildfly user and change ownership of /opt/wildfly to user: wildfly
sudo adduser -r wildfly
sudo chown -R wildfly:wildfly /opt/wildfly/

#chekc it





