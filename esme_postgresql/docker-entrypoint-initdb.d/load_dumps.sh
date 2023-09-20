#!/bin/bash

set -e -x

databases=("bio_icare_drone" "bloon_project" "pizza_shop" "sportsdb" "transtats")

for database in "${databases[@]}"; do
  psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
      CREATE DATABASE ${database};
      GRANT ALL PRIVILEGES ON DATABASE ${database} TO postgres;
EOSQL

  psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "${database}" < /docker-entrypoint-initdb.d/"${database}".sql.dump
done
