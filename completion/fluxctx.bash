_fluxctx()
{
  local curr_arg;
  curr_arg=${COMP_WORDS[COMP_CWORD]}
  COMPREPLY=( $(compgen -W "- \
  --get-alias \
  -f --force \
  -d --delete \
  -h --help \
  $(kubectl -n flux get deployments -l app=flux -o=jsonpath='{.items[*].metadata.labels.release}')" -- $curr_arg ) );
}

complete -F _fluxctx fluxctx
