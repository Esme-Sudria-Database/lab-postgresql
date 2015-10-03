#!/bin/bash

SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd );

function main
{
	set -o errexit
	set -o pipefail
	set -o nounset

  apt-get install -y python-pip
  pip install -U ansible

  # (ansible-galaxy list | grep geerlingguy.security) || ansible-galaxy install geerlingguy.security

}

main "$@"
