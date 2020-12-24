#!/Users/wtraylor/usr/local/bin/bash

export PYENV_VERSION=3.8.2
#set version for pyenv to reference, if used

#installed into a pyenv virtualenv (using pyenv managed python 3.7.1)
#BORGMATIC=/Users/wtraylor/.pyenv/versions/borgmatic/bin/borgmatic
BORGMATIC=/Users/wtraylor/usr/local/bin/borgmatic

#from brew (cask)
BORG=/Users/wtraylor/usr/local/bin/borg

TOUCHFILE=/private/var/tmp/borgmatic/touchfile
TOUCHDIR=/private/var/tmp/borgmatic

if [ ! -f $BORGMATIC ]; then
    echo "Error: borgmatic not found" 1>&2
    exit 1;
elif [ ! -f $BORG ]; then
    echo "Error: borg not found" 1>&2
    exit 1;
fi

$BORGMATIC -v2
BORGEXIT=$?
if [ "$BORGEXIT" -ne 0 ]; then
    echo "Error: Borg Backup Failed" 1>&2
    exit $BORGEXIT
else
  if [ ! -e "$TOUCHDIR" ]; then
      echo "Warning: $TOUCHDIR doesn't exist. Creating..." 1>&2

      #try to create directory
      mkdir $TOUCHDIR || {
        echo "Error: Creating $TOUCHDIR failed" 1>&2
        exit 1;
      }
  elif [ ! -d "$TOUCHDIR" ]; then
      echo "Error: $TOUCHDIR exists but is not a directory" 1>&2
      exit 1
  else 
    #touch the file, error if it fails
    if ! touch $TOUCHFILE; then 
      echo "Error: Cannot touch touchfile" 1>&2
      exit 1
    fi
  fi
  exit 0
fi
