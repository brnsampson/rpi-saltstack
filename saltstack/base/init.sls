# base state run by all hosts. Please keep this small.

python-pygit2:
  pkg.installed

/etc/salt/minion:
  file.managed:
    - source: salt://templates/base/minion
