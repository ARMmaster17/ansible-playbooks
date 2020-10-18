Role Name
=========

Creates a container on Proxmox cluster and loads it with the network properties and credentials for further initialization by Ansible.

Requirements
------------

- Proxmox cluster API is reachable by DNS from Ansible host.

Role Variables
--------------

| Variable | Description | Default | Required |
| --- | --- | --- | --- |
| pve_node | Node for container to be deployed on. | pxvh[1:3] | no |
| vm_up_ip | Uplink network IP address with CIDR netmask. | dhcp | no |
| vm_up_ip6 | Uplink network IPv6 address with CIDR netmask. | dhcp | no |
| vm_up_gateway | Uplink gateway. | N/A | no(if DHCP is enabled) |
| vm_up_network | Uplink network (internal/dmz). | internal | no |
| vm_cores | Cores assigned to container. | 1 | no |
| vm_ram | RAM assigned to container. | 512 | no |
| vm_disk | Disk size of container. | 8 | no |
| vm_onboot | If container should start at boot(yes/no). | yes | no |

Dependencies
------------

N/A

Example Playbook
----------------

Playbook MUST be run with the argument `--vault-password-file /etc/ansible/vault.secret`. The initial ping/fact gathering must also be skipped since the container does not yet exist.


    - hosts: servers
      gather_facts: no
      roles:
         - role: container-core
           vars:
             vm_up_ip: 10.1.2.3.4/16

One-off role initializations can also be triggered with `ansible <hostname> -m include_role -a "name=container-base vm_up_ip=10.1.2.3.4/24" --vault-password-file /etc/ansible/vault.secret`. Note that the host must be added to the `/etc/ansible/hosts` file first.


License
-------

MIT

