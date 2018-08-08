#!/bin/bash

# Author: Karl Olson <karl.olson@gmail.com>

# Display battery percentage for all reporting devices
# Helpful to see your bluetooth keyboard and trackpad charge status
# Line pairing trick taken from:
#  https://stackoverflow.com/questions/1513861/how-do-i-pair-every-two-lines-of-a-text-file-with-bash

ioreg -r -d 1 -k BatteryPercent        `# find all devices with battery status`  \
 | egrep '"Product"|"BatteryPercent"'  `# get the product name and percentage`   \
 | sed 's/.*= //'                      `# strip everything up to equals`         \
 | sed 's/"//'                         `# remove the first quote`                \
 | sed 's/"/:/'                        `# replace the other quote with a colon`  \
 | sed '$!N;s/\n/ /'                   `# pair every two lines`

