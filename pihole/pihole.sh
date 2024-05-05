#!/bin/bash

# Check if pi-hole is installed by running the pihole command
if [ -z "$(command -v pihole)" ]; then
  echo "Pi-hole is not installed. Installing"
  mkdir -p /etc/pihole
  cp ./pihole/setupVars.conf /etc/pihole/setupVars.conf
  curl -sSL https://install.pi-hole.net | sudo bash /dev/stdin --unattended
  echo "The default password is 'password'"
else
  echo "Pi-hole is installed. Updating"
  pihole -up
fi