#!/bin/bash

#Downloads and extracts wildfly

# Download wildfly into /tmp
cd /tmp
sudo wget http://download.jboss.org/wildfly/14.0.1.Final/wildfly-14.0.1.Final.tar.gz

#extract wilfly into /opt
sudo tar -xvf wildfly-14.0.1.Final.tar.gz -C /opt

#rename wildfly-14.0.1.Final.tar.gz to as
sudo mv /opt/wildfly-14.0.1.Final /opt/wildfly







