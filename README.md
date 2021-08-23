# Description

This is a scripts for get and set encrypted environment vars from external (http) path encrypted yaml file.

# Usage

``` bash
bash

set +o history

source env-load.sh https://url_vault secret_key

#other commands...

exit

```
