# State for ensuring the salt master service is available and running.

salt_master_config:
  file.managed:
    - name: {{ pillar['salt_master']['config']['location'] }}
    - source: {{ pillar['salt_master']['config']['template'] }}
    - template: jinja
    - watch_in:
      - service: {{ pillar['salt_master']['service']['name'] }}

salt_master:
  pkg.installed:
    - name: {{ pillar['salt_master']['package']['name'] }}
  service:
    - name: {{ pillar['salt_master']['service']['name'] }}
    - running
