# State for ensuring the isc-dhcp-server service is available and running.

isc-dhcp-server:
  pkg.installed

isc-dhcp-server:
  service:
    - running
