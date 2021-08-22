#!/bin/bash

dir="/opt/env-vault"

if [[ ! -e $dir ]]; then
    mkdir $dir

wget -O /opt/env-vault/env-load.sh https://raw.githubusercontent.com/orbisnull/env-vault/main/env-load.sh
chmod +x /opt/env-vault/env-load.sh


wget -O /opt/env-vault/env-vault.py https://raw.githubusercontent.com/orbisnull/env-vault/main/env-vault.py
chmod +x /opt/env-vault/env-vault.py

ln -s /opt/env-vault/env-load.sh /usr/local/bin/env-load.sh
