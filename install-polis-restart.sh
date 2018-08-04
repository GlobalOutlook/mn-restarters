
#!/bin/bash
# Polis Restart Install

# Change the directory to ~/smartnode/
cd ~/.poliscore/

# Download the appropriate scripts
wget https://raw.githubusercontent.com/SmartCash/smartnode/master/clearlog.sh

# Create a cronjob for making sure smartcashd is always running
if ! crontab -l | grep "~/.poliscore/polis-restart.sh"; then
  (crontab -l ; echo "0 0 9 1/1 * ? * ~/.poliscore/polis-restart.sh") | crontab -
fi