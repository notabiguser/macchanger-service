# MAC Randomizer Service

A simple systemd service for randomizing the MAC address of a specific network interface, e.g., `wlan0`.

## Requirements

- `systemd`
- `sudo`
- `ip`
- `macchanger` `https://github.com/alobbs/macchanger`

## Installation

```bash
chmod u+x ./install-macchanger.sh
./install-macchanger.sh
```

## Usage

Write the network interface name after `@`, e.g., `wlan0`:

```bash
sudo systemctl enable --now macchanger@wlan0.service
```

Check the current and permanent MAC addresses:

```bash
macchanger --show wlan0
```

## Notes

Installation path: `/etc/systemd/system/`

`macchanger` uses the `--random` flag, which randomizes the whole MAC address. If you want to keep the vendor part (the first 3 bytes), use `--ending` instead. Edit this line in the service file:

```ini
ExecStart=/usr/bin/macchanger --ending %i
```

Then reload systemd and restart the service:

```bash
sudo systemctl daemon-reload
sudo systemctl restart macchanger@wlan0.service
```

