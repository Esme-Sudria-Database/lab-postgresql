import os

import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']).get_hosts('all')


def test_docker_command_should_exists(host):
    assert host.exists('docker')


def test_docker_compose_command_should_exists(host):
    assert host.exists('docker-compose')
