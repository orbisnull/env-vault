#!/bin/bash

URL=$1
PASSWORD=$2

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"

PY_OUTPUT=`/usr/bin/env python3 $DIR/env-vault.py $1 -p $2`

if [[ $? -ne 0 ]]
then
  echo "failed env-vault"
fi

eval "${PY_OUTPUT}"

>&2 echo "env-load: Environment variables processed."

set -o history
