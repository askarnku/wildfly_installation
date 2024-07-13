# Professional WildFly Installation Guide on EC2

## Step-by-Step Instructions

### 1. Launch an EC2 Instance
- Start a new EC2 instance in your preferred AWS region.
- Configure the security group to allow inbound traffic on all TCP ports from any IP address (0.0.0.0/0).

### 2. Install Git
```sh
sudo yum install -y git
```

### 3. Navigate to the Home Directory
```sh
cd ~
```

### 4. Clone the WildFly Installation Repository
```sh
git clone https://github.com/askarnku/wildfly_installation.git
```

### 5. Change to the Cloned Directory
```sh
cd wildfly_installation
```

### 6. Make the Installation Script Executable
```sh
chmod +x full_install_config.sh
```

### 7. Run the Installation Script
```sh
./full_install_config.sh
```

### 8. Confirm Java Installation
- During the script execution, you will be prompted to confirm the installation of Java 1.8. Type `yes` and press Enter.

### 9. Access the WildFly Administration Console
- Upon successful installation, open your web browser and navigate to:
  ```
  http://<your-public-ip>:8080
  ```
  Replace `<your-public-ip>` with the public IP address of your EC2 instance.

### Additional Notes
- Ensure your EC2 instance's security group allows inbound traffic on port 8080.
- For enhanced security, consider restricting the security group rules to only allow traffic from trusted IP addresses.