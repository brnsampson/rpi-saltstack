# base state run by all hosts. Please keep this small.

/etc/salt/minion:
  file.managed:
    source: salt://templates/base/minion
