#!/usr/bin/env bash
# https://gist.github.com/draptik/9f4b472da9f315aeeb3b
# http://weworkweplay.com/play/rebooting-the-raspberry-pi-when-it-loses-wireless-connection-wifi/

# Check wifi connection...
ping -c4 192.168.117.1 > /dev/null

# '$?' is the exit code of previous ping command.
# If exit code != 0 (failure)...
if [ $? != 0 ]
then
  echo "$(date): No network connection, restarting wlan0" >> /home/emarref/printer_data/logs/checkwifi.log

  # deactivate wifi...
  ip link set wlan0 down
  sleep 5
  # Restart wifi...
  ip link set wlan0 up
fi
