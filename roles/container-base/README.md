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
| pve_node | Node for container to be deployed on. | pxvh1 | no |
| vm_up_ip | Uplink network IP address with CIDR netmask. | N/A | YES |
| vm_up_network | Uplink network (internal/dmz). | internal | no |
| vm_management_ip | IP address with CIDR netmask. | dhcp | no |
| vm_cores | Cores assigned to container. | 1 | no |
| vm_ram | RAM assigned to container. | 512 | no |
| vm_disk | Disk size of container. | 8 | no |
| vm_onboot | If container should start at boot(yes/no). | yes | no |

Dependencies
------------

N/A

Example Playbook
----------------


    - hosts: servers
      roles:
         - role: container-core
           vars:
             vm_up_ip: 10.1.2.3.4/16
             vm_management_ip: 10.5.6.7/16

License
-------

MIT

