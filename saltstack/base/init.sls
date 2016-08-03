# base state run by all hosts. Please keep this small.

python-pygit2:
  pkg.installed

salt_minion_config:
  file.managed:
    - name: /etc/salt/minion
    - source: salt://templates/base/minion
