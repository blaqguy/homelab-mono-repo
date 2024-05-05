#!/bin/bash

# Install yq
if [ -z "$(command -v yq)" ]; then
  echo "yq is not installed. Installing"
  wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/bin/yq &&\
    chmod +x /usr/bin/yq
  chmod 777 /usr/bin/yq
else
  echo "yq is installed"
fi

# Install pihole
if [ -z "$(command -v sudo pihole)" ]; then
  echo "Pi-hole is not installed. Installing"
  mkdir -p /etc/pihole
  cp ./pihole/setupVars.conf /etc/pihole/setupVars.conf
  curl -sSL https://install.pi-hole.net | bash /dev/stdin --unattended
  # Set the password to 'password'
  sudo pihole -a -p password
  echo "The default password is 'password'. Change it or don't. I'm not your Dad"
else
  echo "Pi-hole is installed"
fi
