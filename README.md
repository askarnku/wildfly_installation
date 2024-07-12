# Easy WildFly installation

1. Spin up EC2 instance (make sure inbound traffic accepts ALL TCP 0.0.0.0)

2. Install `git`:
   `sudo yum install -y git`

3. Once git is installed, cd into your home directory:
   `cd ~`

4. Clone repository:
   `git clone https://github.com/askarnku/wildfly_installation.git`

5. cd into folder:
   `cd wildfly_installation`

6. Make `full_install_config.sh` executable:
   `chmod +x full_install_config.sh`

7. Run the script:
   `./full_install_config.sh`

8. It will ask if it can install Java version is 1.8. Type yes.

9. On your browser:
   `<public-ip>:8080`
