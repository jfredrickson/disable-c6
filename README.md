# disable-c6

A systemd service to disable the C6 state upon system boot, preventing Ryzen freezes. [Here is some info on the bug](https://bugzilla.kernel.org/show_bug.cgi?id=196683).

This simply installs `zenstates.py` from [ZenStates-Linux](https://github.com/r4m0n/ZenStates-Linux) and creates a one-shot service based on it.

## Prerequisites

The `zenstates.py` script requires the `msr` kernel module. Ensure that you're either loading the `msr` module at startup or have it compiled into the kernel. If `/dev/cpu/*/msr` exists, then your `msr` module is active.

Refer to your specific distribution and init system to find out how to load kernel modules. For instance, if you're using systemd, refer to `man modules-load.d`.

## Installation

```
git clone https://github.com/jfredrickson/disable-c6.git
cd disable-c6
sudo ./install.sh
```

This will install a systemd unit called `disable-c6` to the default location, `/usr/local/lib/systemd/system/disable-c6.service`, and offer to enable/start the service for you.

You can also customize the install location. See `./install.sh --help` for options.
