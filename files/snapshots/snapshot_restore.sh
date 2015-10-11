#!/bin/bash
# Restore a sql snapshot of a postgresql database
# To use it : ./snapshot.sh pizza_shop

SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd );

function main
{
	if [ -z "$1" ]  && [ -z "${2}" ]
		then
			error_exit "bash ${0} <database> <file_name>"
	fi

	set -o errexit
	set -o pipefail
	set -o nounset

	database=$1
	filename=$2

  dropdb $database
	createdb $database
	psql $database < $filename
}

function error_exit
{
	echo "$1" 1>&2
	exit 1
}

main "$@"
