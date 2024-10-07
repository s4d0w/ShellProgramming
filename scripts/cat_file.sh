#!/bin/bash

FTPUSERS=/etc/vsftpd/ftpusers

for UNAME in $(cat $FTPUSERS | egrep -v '^#|^$')
do
    echo "[  OK  ]: $UNAME"
done
