#!/bin/bash
# polis-restart.sh
# Restarts the server at 9am UTC every day
# 0 0 9 1/1 * ? * ~/.poliscore/polis-restart.sh

echo "Stopping Polis"
polis-cli stop
echo "Sleeping....."
sleep 5
echo "Rebooting now!"
reboot