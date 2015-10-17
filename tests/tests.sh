#!/usr/bin/env bash

set -o errexit
set -o nounset
# set -o xtrace
set -o pipefail

__SCRIPT_DIR__="$(cd "$(dirname "${0}")"; echo $(pwd))"
__DIR__=${__SCRIPT_DIR__}/..
__BASE__="$(basename "${0}")"
__FILE__="${__DIR__}/${__BASE__}"

echo "################################"
echo "Build Information"
echo "Directory: ${__DIR__}"
echo "Filename: ${__FILE__}"
echo "Version Information:"
echo "Ansible Version: $(ansible --version)"
echo "Ansible Playbook Version: $(ansible-playbook --version)"
echo "Operating System: $(lsb_release -d | awk -F: '{ print $2 }' | tr -d '\t')"
echo "Kernel: $(uname -a)"
echo "################################"

echo "### Starting tests"

ansible-playbook --syntax-check --list-tasks -i ${__DIR__}/tests/ansible-dummy.ini ${__DIR__}/site.yml
