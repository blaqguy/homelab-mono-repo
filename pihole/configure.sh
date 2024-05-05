#!/bin/bash

# Install yq
if [ -z "$(command -v yq)" ]; then
  echo "yq is not installed. Installing"
  wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_arm64 -O /usr/bin/yq &&\
    chmod +x /usr/bin/yq
  chmod 777 /usr/bin/yq
else
  echo "yq is installed"
fi

# Extract the value from the YAML file
BLOCK_ICLOUD_PR=$(yq eval '.FTL-CONFIGS.BLOCK_ICLOUD_PR' ./pihole/pihole-config.yml)

# Check if the configuration exists in the file
if grep -q "^BLOCK_ICLOUD_PR=" /etc/pihole/pihole-FTL.conf; then
    # If it exists, ensure it matches the value from the yaml
    sudo sed -i "s/^BLOCK_ICLOUD_PR=.*$/BLOCK_ICLOUD_PR=$BLOCK_ICLOUD_PR/" /etc/pihole/pihole-FTL.conf
else
    # If it does not exist, create it
    echo "BLOCK_ICLOUD_PR=$BLOCK_ICLOUD_PR" | sudo tee -a /etc/pihole/pihole-FTL.conf
fi

# Restart the DNS service
sudo pihole restartdns
