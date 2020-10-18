Role Name
=========

Deploys a combined DHCP/DNS server using dnsmasq.

Requirements
------------

- See `container-base` requirements.
- Network with no existing DHCP services.

Role Variables
--------------

| Variable | Description | Default | Required |
| --- | --- | --- | --- |
| vm_up_ip | IP address. | N/A | YES |
| vm_up_gateway | Uplink gateway | 10.1.0.1 | no |
| vm_up_network | Uplink network | internal | no |

Dependencies
------------

- container-base

Example Playbook
----------------

    - hosts: servers
      roles:
         - dhcp

License
-------

MIT

