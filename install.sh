#!/bin/bash

dir="/opt/env-vault"

if [[ ! -e $dir ]]; then
    mkdir $dir
fi

wget -O /opt/env-vault/requirements.txt https://raw.githubusercontent.com/orbisnull/env-vault/main/requirements.txt
pip3 install -r /opt/env-vault/requirements.txt

wget -O /opt/env-vault/env-load.sh https://raw.githubusercontent.com/orbisnull/env-vault/main/env-load.sh
chmod +x /opt/env-vault/env-load.sh


wget -O /opt/env-vault/env-vault.py https://raw.githubusercontent.com/orbisnull/env-vault/main/env-vault.py
chmod +x /opt/env-vault/env-vault.py

ln -sf /opt/env-vault/env-load.sh /usr/local/bin/env-load.sh

echo "env-vault: Installation completed"

exit 0
