#!/bin/bash

# Modify /etc/systemd/system.conf
# Uncomment the following lines and change them to 10 seconds:
#DefaultTimeoutStartSec=10s
#DefaultTimeoutStopSec=10s

sed -i.bak -e 's/#DefaultTimeoutStartSec.*/DefaultTimeoutStartSec=10s/' -e 's/#DefaultTimeoutStopSec.*/DefaultTimeoutStopSec=10s/' /etc/systemd/system.conf
