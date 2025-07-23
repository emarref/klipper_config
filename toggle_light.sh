#!/usr/bin/env bash

STATE="${1:-TOGGLE}"

mosquitto_pub -u printer -P $MQTT_PASSWORD -h 'homeassistant.local.' -t 'zigbee2mqtt/Office Light Switch/set' -m "{\"state_l1\":\"$STATE\"}"
