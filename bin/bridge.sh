#!/bin/bash
MSG=""
while IFS= read -r line; do
   MSG=$MSG$line"\n"
done
echo -e $MSG | curl https://srs.slac.stanford.edu/JobControlBridge/bridge/mail --data-binary @-
