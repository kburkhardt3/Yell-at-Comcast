# Yell-at-Comcast

This code tests your internet speed and sends an alert if the speed is too low. After a single failed test, the user is notified through email using a custom gmail account and the test is repeated; after a second failed test, an email is sent to the internet service provider on behalf of the home account where the user is CC'ed.

To use this, a few steps must be taken for setup:

 - connect device such as a Raspberry Pi to internet
 - `sudo apt-get install speedtest-cli`
 - `sudo apt-get install speedtest-cli-extras`
 - `dpkg -l mutt` followed by `sudo apt-get install mutt` if mutt does not already exist
 - create gmail account for monitoring device/use existing account
 - set up .muttrc similar to https://gist.github.com/ramn/1923071
 - put `SpeedTracker.sh` and `SpeedEmail.sh` in home directory
 - modify emails and messages appropriately
 - `chmod +x SpeedTracker.sh` and `chmod +x SpeedEmail.sh`
 - `crontab -e` and add to last line `0 * * * * /home/pi/SpeedTracker.sh` for hourly check
 
