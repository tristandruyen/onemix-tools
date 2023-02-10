# onemix-tools
Small script to auto-rotate the touchscreen toghether with screen via data fro iio-sensor-proxy.

Made to work with one-netbook's one mix 2s but should work with basically all touchscreens if you adjust the udev rules... 

Hacked together in one night so code-quality is 💩


### How it works
- Uses one udev rule for each orientation to set a calibration matrix which is then read by libinput
- Bash Script Forces rule changes to be applied immediatly by removing/adding the touchscreen device and restartig the system.d udev service (just triggering the rule doesn't work as libinput doesn't seem to read it then...)
- Ruby script watches stdin and applies rule changes using the bash script
- dbus output and both scripts are tied together via run.sh
- system.d service template isprovided for automatic startup
