# base state run by all hosts. Please keep this small.

{% for package in pillar.get('packages', []) %}
{{ package }}:
  pkg.installed
{% endfor %}

pygit2:
  pip.installed:
    - require:
      - pkg: python-pip

#  pkgrepo.managed:
#    - humanname: Jessie backports main
#    - mirrorlist: deb http://httpredir.debian.org/debian jessie-backports main
#  pkgrepo.managed:
#    - humanname: Jessie stretch main
#    - mirrorlist: deb http://httpredir.debian.org/debian stretch main
#  pkg.installed

salt_minion_config:
  file.managed:
    - name: /etc/salt/minion
    - source: salt://templates/base/minion
