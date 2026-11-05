#!/usr/bin/env bash

# MAC Randomizer
# Read README.md for more information.

set -euo pipefail

# Specific network interface (default: wlan0):
INTERFACE="${1:-wlan0}"

sudo install -m 644 ./macchanger@.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable --now macchanger@"$INTERFACE".service
macchanger --show "$INTERFACE"

