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

By default, the script uses `wlan0`. For another interface, pass the name as an argument:

```bash
./install-macchanger.sh wlp3s0
```

## Usage

To get a new random MAC address:

```bash
./install-macchanger.sh
```

Check the current and permanent MAC addresses:

```bash
macchanger --show wlan0
```

Turn the service on for one more interface. Write its name after `@`:

```bash
sudo systemctl enable macchanger@wlp3s0.service
```

## Notes

Installation path: `/etc/systemd/system/`

`macchanger` uses the `--random` flag, which randomizes the whole MAC address. If you want to keep the vendor part (the first 3 bytes), use `--ending` instead. Edit this line in the service file:

```ini
ExecStart=/usr/bin/macchanger --ending %i
```

Then run install-macchanger:

```bash
./install-macchanger.sh
```

