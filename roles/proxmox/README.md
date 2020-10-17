Role Name
=========

This playbook initializes a new physical Proxmox host and prepares it to be joined to the Firecore cluster.

Requirements
------------

- Clean Proxmox host that is NOT joined to Firecore cluster.

Role Variables
--------------

N/A

Dependencies
------------

N/A

Example Playbook
----------------


    - hosts: proxmox
      roles:
         - { role: proxmox }

License
-------

MIT
