#!/usr/bin/env bash

# MAC Randomizer
# Read README.md for more information.

set -euo pipefail

# Specific network interface:
INTERFACE="wlan0"

sudo install -m 644 ./macchanger@.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo ip link set dev "$INTERFACE" down
sudo systemctl enable --now macchanger@"$INTERFACE".service
sudo ip link set dev "$INTERFACE" up
macchanger --show "$INTERFACE"

