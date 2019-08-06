#compdef fluxctx

local FLUXCTX="${HOME}/.config/flux/current_fluxctx"
PREV=""
if [ -f "$FLUXCTX" ]; then
    # show '-' only if there's a saved previous context
    local PREV=$(cat "${FLUXCTX}")
    _arguments "1: :((- \
        --get-alias \
        -f --force \
        -d --delete \
        -h --help \
        $(kubectl -n flux get deployments -l app=flux -o=jsonpath='{.items[*].metadata.labels.release}')))"
else
    _arguments "1: :(\
      --get-alias \
      -f --force \
      -d --delete \
      -h --help \
      $(kubectl -n flux get deployments -l app=flux -o=jsonpath='{.items[*].metadata.labels.release}'))"
fi
