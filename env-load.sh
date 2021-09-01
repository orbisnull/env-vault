#!/bin/bash

URL=$1
PASSWORD=$2

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do
  DIR="$(cd -P "$(dirname "$SOURCE")" >/dev/null 2>&1 && pwd)"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
DIR="$(cd -P "$(dirname "$SOURCE")" >/dev/null 2>&1 && pwd)"

PY_OUTPUT=$(/usr/bin/env python3 $DIR/env-vault.py $URL -p $PASSWORD)

if [[ $? -ne 0 ]]; then
  echo "failed env-vault"
fi

eval "${PY_OUTPUT}"

echo >&2 "env-load: Environment variables processed."

set -o history
