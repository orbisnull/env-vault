This is a python scripts for get encrypted environment vars from external (http) path


#Usage


``` bash
bash

set +o history

source env-load.sh https://url_vault secret_key

#other commands...

exit

```