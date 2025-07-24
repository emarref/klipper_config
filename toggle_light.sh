#!/usr/bin/env bash

STATE="${1:-TOGGLE}"

cd "$(dirname "$0")"
set -a && source .env && set +a

mosquitto_pub -u printer -P "$MQTT_PASSWORD" -h "homeassistant.local" -t "zigbee2mqtt/Office Light Switch/set" -m "{\"state_l1\":\"$STATE\"}"
