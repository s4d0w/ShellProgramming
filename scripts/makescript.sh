#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <scriptfile>"
    exit 1
fi
SCRIPTFILE=$1
SCRIPTBASE=/root/shell

cat << EOF > $SCRIPTBASE/$SCRIPTFILE
#!/bin/bash


EOF
chmod 700 $SCRIPTBASE/$SCRIPTFILE
