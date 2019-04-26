#/usr/bin/env bash

RULE_PATH=/etc/udev/rules.d/
SRC_PATH="/home/tristan/code/onemix-tools/"
BOTTOM_FILE=__bottom__99-goodix.rules.
RIGHT_FILE=__right__99-goodix.rules.
LEFT_FILE=__left__99-goodix.rules.
TOP_FILE=__top__99-goodix.rules.

case "$1" in
right)
  echo right is down
  cp $(echo "$SRC_PATH""$RIGHT_FILE") $(echo "$RULE_PATH""99-goodix.rules")
  ;;
bottom)
  cp $(echo "$SRC_PATH""$BOTTOM_FILE") $(echo "$RULE_PATH""99-goodix.rules")
  echo bottom is down
  ;;
left)
  echo left is down
  cp $(echo "$SRC_PATH""$LEFT_FILE") $(echo "$RULE_PATH""99-goodix.rules")
  ;;
top)
  echo up is down :O
  cp $(echo "$SRC_PATH""$TOP_FILE") $(echo "$RULE_PATH""99-goodix.rules")
  ;;
*)
  echo els
  echo WAT
  ;;
esac

udevadm control --reload

udevadm trigger --attr-match=name="Goodix*" -v --action remove
udevadm trigger --attr-match=name="Goodix*" -v --action add

systemctl restart systemd-udev-trigger
