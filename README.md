# fluxctx

[![Build Status](https://travis-ci.org/ogerbron/fluxctx.svg?branch=master)](https://travis-ci.org/ogerbron/fluxctx/)

fluxctx (flux context) is a tool to easily manage and switch between several flux deployment, when using fluxctl CLI.

[Flux](https://github.com/fluxcd/flux) is a GitOps Kubernetes operator to automatically ensure that the state of a cluster matches the config in git.

## fluxctx how to

To make fluxctx work, it is assumed that flux is deployed in a kubernetes namespace named `flux`, and that it has the following labels:

- app=flux
- release=another_name

Let's say you have two flux deployments in your kubernetes cluster, `flux1` and `flux2`. They will have the following labels:

- `flux1`: app=flux,release=flux1
- `flux2`: app=flux,release=flux2

You can customize the namespace and the labels by overriding the following vars in the [fluxctx](./fluxctx) script:

| Variable name       | Default   |
|---------------------|:---------:|
| `FLUXAPP_LABEL`     | `flux`    |
| `FLUXNS`            | `flux`    |
| `FLUXRELEASE_LABEL` | `release` |

```bash
USAGE:
  fluxctx                              : list the deployments
  fluxctx <NAME>                       : switch to deployment <NAME>
  fluxctx -                            : switch to the previous deployment
  fluxctx -d <NAME>                    : delete deployment <NAME> ('.' for current-deployment)
                                         (this command won't delete the user/cluster entry
                                         that is used by the deployment)

  fluxctx --get-alias                  : Display the alias to copy paste in your .bashrc or
                                         equivalent

  fluxctx -h,--help                    : show this message
```

Examples:

```bash
# Display flux deployments
$ fluxctx
deployment1
deployment2
testing-deployment

# Switch deployment
$ fluxctx flux-testing-deployment
Activated [flux-testing-environments].

# Switch to previous deployment
$ fluxctx -
Activated [deployment1].

# Delete a deployment
$ fluxctx -d deployment2
Deleting deployment "deployment2"...
Deleted [deployment2].
```

`fluxctx` supports Tab completion on bash/zsh/fish shells to quickly type deployment names.

## Installation

### Linux/macOS

`fluxctx` is written in Bash, so you should be able to install
it to any POSIX environment that has Bash installed.

- Download the `fluxctx` script somewhere in your `PATH` and make it executable, e.g.:

```bash
sudo curl -L https://raw.githubusercontent.com/ogerbron/fluxctx/master/fluxctx -o /usr/local/bin/fluxctx
sudo chmod +x /usr/local/bin/fluxctx
```

- Install bash/zsh/fish [completion scripts](completion/) (e.g. for Ubuntu, copy the scripts to `/etc/bash_completion.d/`
and restart your terminal)
- Add the alias in your `.bashrc`, `.zshrc` or equivalent. To get the alias:

```bash
fluxctx --get-alias
# Or as a one liner (don't forget to reload your terminal)
fluxctx --get-alias >> ~/.bashrc
```
