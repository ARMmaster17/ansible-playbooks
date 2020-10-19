#!/bin/bash
echo "Deploying DHCP services..."
ansible-playbook infra/dhcp.yml --vault-password-file /etc/ansible/vault.secret
echo "Deploying APT caching services..."
ansible-playbook net/apt-cache.yml --vault-password-file /etc/ansible/vault.secret
