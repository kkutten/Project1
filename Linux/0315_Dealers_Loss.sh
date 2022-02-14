#!/bin/bash
echo "March 15"
awk '/0[58].+ AM|02.+ PM/ {print $1,$2,$5,$6}' 0315_Dealer_schedule
