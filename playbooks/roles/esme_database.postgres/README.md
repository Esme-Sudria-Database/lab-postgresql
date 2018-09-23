esme_database.postgres
======================

instanciate a postgres service as docker container

Requirements
------------

* docker

Role Variables
--------------

A description of the settable variables for this role should go here, including
any variables that are in defaults/main.yml, vars/main.yml, and any variables
that can/should be set via parameters to the role. Any variables that are read
from other roles and/or the global scope (ie. hostvars, group vars, etc.) should
be mentioned here as well.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables
passed in as parameters) is always nice for users too:

```yaml
- hosts: servers
      roles:
         - role: esme_database.postgres
           esme_database_postgres_port : 5432

```
License
-------

BSD

Author Information
------------------

* Fabien Arcellier (fabien.arcellier@gmail.com)
