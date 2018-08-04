
#!/bin/bash
# Polis Restart Install

# Change the directory to ~/smartnode/
cd ~/.poliscore/

# Download the appropriate scripts
wget https://github.com/GlobalOutlook/mn-restarters/blob/master/polis-restart.sh

# create log file if it doesn't exist
touch restart.log

# Create a cronjob for making sure smartcashd is always running
if ! crontab -l | grep "~/.poliscore/polis-restart.sh"; then
  (crontab -l ; echo "0 0 9 1/1 * ? * ~/.poliscore/polis-restart.sh >> ~/.poliscore/restart.log 2>&1") | crontab -
fi