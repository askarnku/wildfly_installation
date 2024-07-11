#!/bin/bash

# WildFly Setup and Start Script for Standalone Mode

# Configuration variables
JAVA_HOME="/usr/lib/jvm/java-1.8.0-amazon-corretto"
JBOSS_HOME="/opt/wildfly"
JBOSS_USER="wildfly"
JBOSS_MODE="standalone"
JBOSS_CONFIG="standalone.xml"
STARTUP_WAIT=60
SHUTDOWN_WAIT=60
JBOSS_CONSOLE_LOG="/var/log/wildfly/console.log"
JBOSS_OPTS="--admin-only -b 127.0.0.1"


# Create log directory if it doesn't exist
if [ ! -d "/var/log/wildfly" ]; then
    sudo mkdir -p "/var/log/wildfly"
    sudo chown -R $JBOSS_USER:$JBOSS_USER "/var/log/wildfly"
fi

# Change ownership of the WildFly directory
sudo chown -R $JBOSS_USER:$JBOSS_USER $JBOSS_HOME

# Starting WildFly
echo "Starting WildFly in standalone mode..."
sudo -u $JBOSS_USER $JBOSS_HOME/bin/standalone.sh -c $JBOSS_CONFIG -Djboss.bind.address=0.0.0.0 $JBOSS_OPTS > $JBOSS_CONSOLE_LOG 2>&1 &

# Wait for startup
echo "Waiting for WildFly to start..."
sleep $STARTUP_WAIT

echo "WildFly should now be running in standalone mode."