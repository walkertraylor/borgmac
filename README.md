# Schedule automated backups on MacOS with Borg Backup

Contains launchd definitions, execution and validation wrapper scripts, produces loggable output, and notifies on failure.

## To Install:

* Install borgbackup and borgmatic via brew or pip and ensure executables are available in your search path.
*Optionally install terminal-notifier if you want desktop notification on error.
* Configure your borg repo if you have not already.
* Configure borgmatic to your liking.
* Ensure borgmatic executes successfully from command line.
* Copy .sh files into a directory in your PATH, such as ~/bin.
* Copy .plist files into ~/Library/LaunchAgents. 
* Load ("install") launchd service with "launchctl load <path to plist config file>"
* Immediately execute service (to test) with "launchctl start <path to plist config file>"

Consider using the app, "LaunchControl" for easily reviewing and modifying launchd service configuration.
