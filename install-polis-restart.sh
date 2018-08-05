
#!/bin/bash
# Polis Restart Install

# Change the directory to ~/smartnode/
echo "Jumping to Polis directory"
cd ~/.poliscore/

# remove script if found
echo "Removing polis-restart.sh if it exists"
rm ~/.poliscore/polis-restart.sh

# Download the appropriate scripts
echo "Downloading the latest version of the script"
wget https://raw.githubusercontent.com/GlobalOutlook/mn-restarters/master/polis-restart.sh

# Give execute permission to the cron scripts
echo "Setting permission on the script"
chmod 0700 ./polis-restart.sh

# create log file if it doesn't exist
echo "Creating the restart.log file if it does not exist"
touch restart.log

# Create a cronjob for making sure smartcashd is always running
echo "Setting up the cron job"
if ! crontab -l | grep "~/.poliscore/polis-restart.sh"; then
  (crontab -l ; echo "0 9 * * * ~/.poliscore/polis-restart.sh > ~/.poliscore/restart.log 2>&1") | crontab -
fi

echo "Listing the cron jobs"
crontab -l