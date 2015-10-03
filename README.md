Usage
======

To create the virtual machine, use the command

    vagrant up

This script will use image from ubuntu 14.04. Ansible will install Postgresql from apt repository and other dependencies, then it will configure it to open network access (don't do that in production).

Next it wil create a database, and import sportsdb sample.

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

You can use pgadmin3 against this virtual machine. When you create a profile, set the host to localhost:5432 or 192.168.33.10:5432

You can use either the account admin:admin or sportsdb:sportsdb  as login:password.

admin is a power user on postgresql database (never do that in production !).

Check ansible playbook
=======================

    make tests

If it doesn't work due to missing ansible-galaxy roles, use :

    bash scripts/bootstrap-tests.sh
