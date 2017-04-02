firewall:
  enabled: True
  install: True
  strict: False
  whitelist:
    networks:
      ips_allow:
        - 10.0.0.0/24
  services:
    ssh:
      block_nomatch: False
      ips_allow:
        - '192.168.1.0/24'
      interfaces:
        - eth0
      protos:
        - tcp
    53:
      block_nomatch: False
      ips_allow:
        - '10.0.0.0/24'
      interfaces:
        - br0
      protos:
        - tcp
        - udp
    67:
      block_nomatch: False
      ips_allow:
        - '10.0.0.0/24'
      interfaces:
        - br0
      protos:
        - udp
    68:
      block_nomatch: False
      ips_allow:
        - '10.0.0.0/24'
      interfaces:
        - br0
      protos:
        - udp
  forwarding:
    - proto: tcp
      source_ip: '192.168.1.0/24'
      destination_ip: '10.0.0.0/24'
      dport: 80
    - proto: tcp
      source_ip: '192.168.1.0/24'
      destination_ip: '10.0.0.0/24'
      dport: 443
    - proto: tcp
      source_ip: '192.168.1.0/24'
      destination_ip: '10.0.0.0/24'
      dport: 445
    - proto: tcp
      source_ip: '192.168.1.0/24'
      destination_ip: '10.0.0.0/24'
      dport: 139
    - proto: udp
      source_ip: '192.168.1.0/24'
      destination_ip: '10.0.0.0/24'
      dport: 137
    - proto: udp
      source_ip: '192.168.1.0/24'
      destination_ip: '10.0.0.0/24'
      dport: 138
  nat:
    - chain: POSTROUTING
      interface: eth0
      jump: MASQUERADE
    - chain: PREROUTING
      interface: eth0
      jump: DNAT
      proto: tcp
      dport: 80
      destination_port: '10.0.0.100-10.0.0.199'
    - chain: PREROUTING
      interface: eth0
      jump: DNAT
      proto: tcp
      dport: 443 
      destination_port: '10.0.0.100-10.0.0.199'
    - chain: PREROUTING
      interface: eth0
      jump: DNAT
      proto: tcp
      dport: 139 
      destination_port: '10.0.0.100-10.0.0.199'
    - chain: PREROUTING
      interface: eth0
      jump: DNAT
      proto: tcp
      dport: 445
      destination_port: '10.0.0.100-10.0.0.199'
    - chain: PREROUTING
      interface: eth0
      jump: DNAT
      proto: udp
      dport: 137 
      destination_port: '10.0.0.100-10.0.0.199'
    - chain: PREROUTING
      interface: eth0
      jump: DNAT
      proto: udp 
      dport: 138 
      destination_port: '10.0.0.100-10.0.0.199'

dhcpd:
  domain_name: whobe.us
  domain_name_servers:
    - seed01.whobe.us
  listen_interfaces:
    - br0
  subnets:
    10.0.0.0:
      comment: This 
