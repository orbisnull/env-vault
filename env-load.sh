#!/bin/bash

URL=$1
PASSWORD=$2


PY_OUTPUT=`/usr/bin/env python3 env-vault.py $1 -p $2`


if [[ $? -ne 0 ]]
then
  echo "failed env-vault"
fi

echo "${PY_OUTPUT}"

# readarray -td, array_env <<<"$PY_OUTPUT"; declare -p array_env;
# unset 'array_env[-1]';

# # echo "${array_env[@]}"

# for elem in "${array_env[@]}"
# do
#    : 
#    echo "$elem"
# done

eval "${PY_OUTPUT}"
