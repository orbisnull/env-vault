#!/bin/bash

URL=$1
PASSWORD=$2

PY_OUTPUT=`/usr/bin/env python3 env-vault.py $1 -p $2`

if [[ $? -ne 0 ]]
then
  echo "failed env-vault"
fi

eval "${PY_OUTPUT}"
