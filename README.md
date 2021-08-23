# Description

This is a scripts for get and set encrypted environment vars from external (http) path encrypted yaml file.

# Installation

```bash
wget -O - https://raw.githubusercontent.com/orbisnull/env-vault/main/install.sh | bash
```

# Usage

``` bash
bash

set +o history

source env-load.sh https://url_vault secret_key

#other commands...

exit

```
