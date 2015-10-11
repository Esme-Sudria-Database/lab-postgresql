#!/bin/bash
# Create a snapshot of a postgresql database at the current date
# To use it : ./snapshot.sh pizza_shop

SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd );

function main
{
	if [ -z "$1" ]
		then
			error_exit "bash ${0} <database>"
	fi

	set -o errexit
	set -o pipefail
	set -o nounset

	database=$1
  now=$(date +"%Y_%m_%d_%H-%M")
  pg_dump $database > "${SCRIPT_DIR}/${database}_${now}.sql"

}

function error_exit
{
	echo "$1" 1>&2
	exit 1
}

main "$@"
