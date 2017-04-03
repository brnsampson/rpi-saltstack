# This is only used to bootstrap a salt minion config that can further bootstrap itself with salt-formula off github.

salt_minion_config:
  file.managed:
    - name: /etc/salt/minion
    - source: salt://templates/services/salt/minion
