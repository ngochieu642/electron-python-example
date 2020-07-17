#!/usr/bin/env bash
# Tell apt-get we're never going to be able to give manual
# feedback:
export DEBIAN_FRONTEND=noninteractive

# Update the package listing, so we know what package exist:
apt-get update

# Install security updates:
apt-get -y upgrade

# Install a new package, without unnecessary recommended packages:
apt-get -y install libgtk2.0-0 libx11-xcb1 libxtst6 libgconf-2-4 libnss3 libasound2

# Delete cached files we don't need anymore:
apt-get clean
rm -rf /var/lib/apt/lists/*