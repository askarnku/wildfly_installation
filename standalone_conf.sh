#!/bin/bash

#Standalone configuration change

# Back up first
sudo cp /opt/wildfly/standalone/configuration/standalone.xml /opt/wildfly/standalone/configuration/standalone.xml.bak

sudo sed -i 's/127.0.0.1/0.0.0.0/g' /opt/wildfly/standalone/configuration/standalone.xml

sudo cat /opt/wildfly/standalone/configuration/standalone.xml | grep '0.0.0.0'



