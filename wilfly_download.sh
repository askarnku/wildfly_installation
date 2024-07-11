#!/bin/bash

#Downloads and extracts wildfly

# Download wildfly into /tmp
cd /tmp
sudo wget https://github.com/wildfly/wildfly/releases/download/32.0.1.Final/wildfly-32.0.1.Final.tar.gz

#extract wilfly into /opt
sudo tar -xvf wildfly-32.0.1.Final.tar.gz -C /opt/

#rename wildfly-14.0.1.Final.tar.gz to as
sudo mv wildfly-32.0.1.Final/ wildfly

# Add wildfly user and change ownership of /opt/wildfly to user: wildfly
sudo adduser -r wildfly
sudo chown -R wildfly:wildfly /opt/wildfly/

#chekc it





