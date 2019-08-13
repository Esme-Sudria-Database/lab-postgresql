import os

import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']).get_hosts('all')


def test_hosts_file(host):
    f = host.file('/etc/hosts')

    assert f.exists
    assert f.user == 'root'
    assert f.group == 'root'


def test_psql_should_be_able_to_query_pizza_shop_database(host):
    cmd = host.run("PGPASSWORD=user psql -U user -d pizza_shop -c SELECT 1+1")
    assert cmd.rc == 0
