# base state run by all hosts. Please keep this small.

{% for package in pillar.get('packages', []) %}
{{ package }}:
  pkg.installed
{% endfor %}

pygit2:
  pip.installed:
    - require:
      - pkg: python-pip
