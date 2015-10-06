This repository contains scripts to create a virtual machine that exposes databases we use
during classes:

* sportsdb
* pizza_shop
* transtats (you have to continue the installation with [Flywaydb-Transtats](https://github.com/Esme-Sudria-Database/Flywaydb-Transtats))

![pgadmin3](https://cloud.githubusercontent.com/assets/159559/10293161/9bb4f68c-6ba2-11e5-8759-8c9caa0e20d3.png)

Setup your computer
====================

You will need those softwares on your computer :

* [Virtual box](https://www.virtualbox.org/)
* [Vagrant](https://www.vagrantup.com/)
* [Git](https://git-scm.com/)

On linux
---------

    sudo apt-get install virtualbox
    sudo apt-get install vagrant
    sudo apt-get install git

On windows
-----------

Download and install the 3 softwares above.

Usage
======

Clone this repository :

    git clone https://github.com/Esme-Sudria-Database/Vagrant-Postgresql.git

To create the virtual machine, use the command

    cd Vagrant-Postgresql
    vagrant up

This script will use image from ubuntu 14.04. Ansible will install Postgresql from apt repository and other dependencies, then it will configure it to open network access (don't do that in production).

Next it wil create a database, and import sportsdb sample.

Use the postgresql database sportsdb
======================================

    ssh user@192.168.33.10

You should access to the vm. Use the following command to manipulate database

    psql sportsdb

Connect on the machine as administrator
=======================================

    vagrant ssh

Use external client (like pgadmin3)
====================================

You can use pgadmin3 against this virtual machine. When you create a profile, set the host to 192.168.33.10:5432

You can use either the account admin:admin or user:user as login:password.

![server7](https://cloud.githubusercontent.com/assets/159559/10293207/d3642ec2-6ba2-11e5-8c4f-8a39e3f1c7f3.png)

admin is a power user on postgresql database (never do that in production !).

Check ansible playbook
=======================

    make tests

If it doesn't work due to missing ansible-galaxy roles, use :

    bash scripts/bootstrap-tests.sh
