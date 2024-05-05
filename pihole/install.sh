#!/bin/bash

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
