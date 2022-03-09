#!/bin/sh
set -e
nix-shell -p cacert cachix curl jq nix --run "sh docker/startup_script.sh"