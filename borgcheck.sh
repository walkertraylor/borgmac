#!/Users/wtraylor/usr/local/bin/bash
RBENV_VERSION=2.7.2
TOUCHFILE=/private/var/tmp/borgmatic/touchfile

if [ ! -f $TOUCHFILE ]; then
    terminal-notifier -title "Borg Backup" -message "Borg Backup Failed: Touch File Not Found"
    echo "Borg Backup Failed: Touch File Not Found"
    exit 0;
fi

#if touchfile is older than 24 hours, display popup
age=$(($(date +%s) - $(stat -t %s -f %m -- "$TOUCHFILE")))
if [ $age -gt 86400 ]; then 
	days=$(($age/86400))
        terminal-notifier -title "Borg Backup" -message "Backup failed for $days days"
	echo "Backup failed for $days days"
fi

if [ -f $TOUCHFILE ]; then
    terminal-notifier -title "Borg Backup" -message "Borg Backup Succeeded: Touch File Found"
    echo "Borg Backup Succeeded: Touch File Found"
    exit 0;
fi
