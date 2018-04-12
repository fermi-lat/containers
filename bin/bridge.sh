#!/bin/bash
MSG=""
while IFS= read -r line; do
   MSG=$MSG$line"\n"
done
echo -e $MSG | curl --retry 10 -s https://srs.slac.stanford.edu/JobControlBridge/bridge/mail --data-binary @-
