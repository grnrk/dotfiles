

NOTE: This is not needed with sway, since sway remembers workspace display placement. In sway, this Just Works. 

# Monitor hotplugging with i3wm

UDEV is used to detect monitor changes and trigger a systemd service, which runs a script to turn on/off monitors when (dis-)connected.
Additionally, i3-workspace monitor mappings are saved at monitor disconnect and restored to the saved state at monitor reconnect.

## Dependencies

* i3ipc-python - [github repository](https://github.com/acrisci/i3ipc-python)
  (Make sure this is installed for the user that will be executing _i3-workspaces.py_.)
  Installation: `apt install python3-i3ipc`

## Adapt variables to reflect your environment

Before installing, check the following and modify files accordingly.

* Get the monitor device name.
Run: `sudo udevadm monitor` and plug/unplug the monitor.
Look for something like `KERNEL[12595278.214807] change   /devices/pci0000:00/0000:00:02.0/drm/card0 (drm)`, where card0 is the main device name.

Alt. look for the device name under /sys/class/drm/ when connected.

1. 99-monitor-hotplug.rules

* Set the correct device name for udev event: KERNEL.

2. monitor-hotplug.sh

* Set `DEVICE` to the same device name as above (cardX).
* Set `EXT_MONITOR` to what xrandr is calling the external monitor port. (which may be different to what it's called under /sys/class/drm.)
* Set `INT_MONITOR` to what xrandr is calling your laptop monitor.
* If the ouput of `printenv DISPLAY` is not `:0`, set DISPLAY to whatever was outputted by printenv.

3. monitorhotplug.service

* Set your username as `User`.

## Install UDEV rule

* Add an udev-rule to listen for external monitor state change.
  `sudo cp 99-monitor-hotplug.rules /etc/udev/rules.d/`
* Reload UDEV rules:
  `sudo udevadm control --reload-rules`

## Install scripts

Link or copy the scripts `monitor-hotplug.sh` and `i3-workspaces.py` to /usr/local/bin/

## Install systemd service

`sudo cp monitorhotplug.service /etc/systemd/system/ && sudo systemctl daemon-reload`

# Other related, possibly useful

## Tools

* arandr - A graphic display manager.

