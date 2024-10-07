#!/bin/bash

if [    $# -ne 1    ]; then
    echo "Usage: $0 <scriptfile>"
    exit 1
fi
SCRIPTFILE=$1
SHELLBASE=/root/shell

cat << EOF >> $SHELLBASE/$SCRIPTFILE
#!/bin/bash


EOF
chmod 700 $SHELLBASE/$SCRIPTFILE
