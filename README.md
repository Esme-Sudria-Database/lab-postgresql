Usage
======

To install the database, use the command

    vagrant up

Use the postgresql database sportsdb
======================================

    ssh sportsdb@192.168.33.10

You should access to the vm. Use the following command to manipulate database

    psql

Connect on the machine as administrator
=======================================

    vagrant ssh

Use external client (like pgadmin3)
====================================

Set the host to localhost:5432 or 192.168.33.10:5432

You can use either the account admin:admin or sportsdb:sportsdb (login:password).

Admin is a root user of postgresql database.

Check ansible playbook
=======================

    make tests

If it doesn't work due to missing ansible-galaxy roles, use :

    bash scripts/bootstrap-tests.sh
