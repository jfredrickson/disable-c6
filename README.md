# disable-c6

A systemd service to disable the C6 state upon system boot, preventing Ryzen freezes.

This simply installs `zenstates.py` from [ZenStates-Linux](https://github.com/r4m0n/ZenStates-Linux) and creates a one-shot service based on it.

## Installation

```
git clone https://github.com/jfredrickson/disable-c6.git
cd disable-c6
sudo ./install.sh
systemctl enable disable-c6.service
systemctl start disable-c6.service
```

This will install a systemd unit called `disable-c6` to the default location, `/opt/disable-c6`, and create a symlink in `/etc/systemd/system`. You can customize the install prefix by running the `install.sh` script with the `--prefix` parameter:

```
sudo ./install.sh --prefix=/usr/local
```
