# onemix-tools
Tools to auto-rotate touchscreen with screen of one-netbook's one mix 2s via data fro iio-sensor-proxy

Hacked together in one night so quality is sh..

Uses udev rules to set a calibration matrix which is then read by libinput
Forces rule changes to be applied by removing/adding the touchscreen udev device and restartig the system.d service
Ruby script watches iio-sensor-proxy output via dbus (see pipe in run.sh)
