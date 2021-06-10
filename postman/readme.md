# Newman

```bash
#!/usr/bin/env bash
set -x

SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

APIURL=${APIURL:-http://127.0.0.1:9090}

npx newman run $SCRIPTDIR/cicd_collection.json \
  --delay-request 500 \
  --global-var "APIURL=$APIURL"

```