# State for a 'seed' host. In general this will be some host that can
# act as a router, dhcp server, pxe server, salt master, etc.
# We should be able to bootstrap our datacenter from this host.

include:
  - services.router
  - services.tftp
  - service.dhcp.server
