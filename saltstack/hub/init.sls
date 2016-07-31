# State for any host which acts as a raspberry pi zero hub. These
# hosts connect over usb and appear as usb network devices. To allow
# These to work we must provide them with a dhcp server and some routing.

include:
  - services/isc-dhcp-server

extend:
  isc-dhcp-server:
    service:
      - running
      - watch:
        - file: /etc/default/isc-dhcp-server
        - file: /etc/dhcp/dhcpd.conf

/etc/defaut/isc-dhcp-server:
  file.managed:
    - source: salt://templates/hub/isc-dhcp-server
    - template: jinja
    - user: root
    - group: root
    - mode: 644

/etc/dhcp/dhcpd.conf:
  file.managed:
    - source: salt://templates/hub/dhcpd.conf
    - template: jinja
    - user: root
    - group: root
    - mode: 644

/usr/lib/systemd/system-shutdown/rpz_shutdown.sh:
  file.managed:
    - source: salt://files/hub/rpz_shutdown.sh
    - user: root
    - group: root
    - mode: 644
