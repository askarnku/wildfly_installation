#!/bin/bash

# Author: Askar

# Check if Java is installed and capture the version output
java_version=$(java -version 2>&1)
echo $java_version

# Check if Java is installed by seeing if the version command succeeded
if [ $? -ne 0 ]; then
    echo "You do not have Java installed."
    read -p "Would you like to install Java? (y/n) " response
    if [[ $response =~ ^[Yy]$ ]]; then
        sudo amazon-linux-extras enable corretto8
        sudo yum update && sudo yum upgrade -y
        sudo yum install -y java-1.8.0-amazon-corretto-devel
        echo "Java has been installed."
    else
        echo "Java installation was skipped."
        exit 1
    fi
else
    # Check if the installed Java version is 1.8
    if [[ "$java_version" != *"1.8"* ]]; then
        echo "Your Java version is not compatible."
        # Offer to install a different Java version
        read -p "Would you like to install a different version of Java? (y/n) " response
        if [[ $response =~ ^[Yy]$ ]]; then
            # Install a different version, here we use Java 11 as an example
            sudo amazon-linux-extras enable corretto8
            sudo yum update && sudo yum upgrade -y
            sudo yum install -y java-1.8.0-amazon-corretto-devel
            echo "Java 8 has been installed. Please configure it as needed."
        else
            echo "No changes made to Java installation."
            exit 2
        fi
    else
        echo "Your Java version is compatible."
    fi
fi


# JAVA_HOME config
if [ -z "$JAVA_HOME" ]; then
    echo 'export JAVA_HOME="/usr/lib/jvm/java-1.8.0-amazon-corretto"' >> ~/.bashrc
    echo 'export PATH=$JAVA_HOME/bin:$PATH' >> ~/.bashrc
    source ~/.bashrc
    echo "JAVA_HOME set to /usr/lib/jvm/java-1.8.0-amazon-corretto and PATH updated."
else
    echo "JAVA_HOME is already set to $JAVA_HOME"
fi


