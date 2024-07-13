#!/bin/bash

#Standalone configuration change

# Back up first
sudo cp /opt/wildfly/standalone/configuration/standalone.xml /opt/wildfly/standalone/configuration/standalone.xml.bak

#Edit standalone.xml to bind 0.0.0.0
sudo sed -i 's/127.0.0.1/0.0.0.0/g' /opt/wildfly/standalone/configuration/standalone.xml

#Output the content of edited file
sudo cat /opt/wildfly/standalone/configuration/standalone.xml | grep '0.0.0.0'



