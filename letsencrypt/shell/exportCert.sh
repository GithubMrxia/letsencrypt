#!/bin/bash

acme.sh --installcert -d $1 --key-file  /root/export_cert/$1.key --fullchain-file /root/export_cert/$1.pem --reloadcmd "$RELOAD_CMD"
