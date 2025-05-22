#!/usr/bin/env bash
# http://weworkweplay.com/play/rebooting-the-raspberry-pi-when-it-loses-wireless-connection-wifi/

# Check wifi connection...
ping -c4 192.168.117.1 > /dev/null

# '$?' is the exit code of previous ping command.
# If exit code != 0 (failure)...
if [ $? != 0 ]
then
  echo "$(date): No network connection, restarting wlan0" >> /home/emarref/printer_data/logs/bouncewifi.log

  # deactivate wifi...
  /sbin/ifdown 'wlan0'
  sleep 5
  # Restart wifi...
  /sbin/ifup --force 'wlan0'
fi
