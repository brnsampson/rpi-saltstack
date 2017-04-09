# base state run by all hosts. Please keep this small.

{%- for package in pillar.get('packages', []) %}
{{ package }}:
  pkg.installed
{%- endfor %}

{%- for user in pillar.get('users', []) %}
{{ user['name'] }}:
  user.present:
    - password: {{ user['password'] }}
    - fullname: {{ user.get('fullname') }}
    - shell: /bin/bash
    - home: /home/{{ user['name'] }}
    - groups:
      - sudo
{%- endfor %}

#{%- for user in pillar.get('absent_users', []) %}
#{{ user['name'] }}:
#  user.absent
#{%- endfor %}
