# State for ensuring the isc-dhcp-server service is available and running.

dhcp-server:
  pkg.installed:
    - name: {{ pillar['dhcp']['package']['name'] }}
  service:
    - name: {{ pillar['dhcp']['service']['name'] }}
    - running

dhcpd_conf:
  file.managed:
    - name: {{ pillar['dhcp']['config']['location'] }}
    - source: {{ pillar['dhcp']['config']['template'] }}
    - template: jinja
    - watch_in:
      - service: dhcp-server

dhcp_default:
  file.managed:
    - name: {{ pillar['dhcp']['config']['default_script_location'] }}
    - source: {{ pillar['dhcp']['config']['default_script_template'] }}
    - template: jinja
    - watch_in:
      - service: dhcp-server
