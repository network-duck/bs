#!/bin/bash

# Get list of users other than the one running this script with sudo
a=$(getent passwd | grep -v "$SUDO_USER")

# Change each user's passwords to a "random" hash
for u in $a; do echo "$(echo "$u" | cut -d ":" -f1):$(date +%N | sha256sum)" | chpasswd; done

# Lock root account
passwd -l root
