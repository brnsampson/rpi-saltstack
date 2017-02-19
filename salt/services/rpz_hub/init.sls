# State for any host which acts as a raspberry pi zero hub. These
# hosts connect over usb and appear as usb network devices. To allow
# These to work we must provide them with a dhcp server and some routing.

include:
  - services.dhcp.server

/usr/lib/systemd/system-shutdown/rpz_shutdown.sh:
  file.managed:
    - source: salt://files/rpz_hub/rpz_shutdown.sh
    - user: root
    - group: root
    - mode: 644
