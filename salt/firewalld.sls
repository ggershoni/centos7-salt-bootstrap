firewalld:
  pkg:
    - installed
  service.running:
    - enable: True
    - require:
      - pkg: firewalld 

firewalld_public:
  firewalld.present:
    - name: public
    - services:
      - ssh
      - http
      - https
    - require:
      - service: firewalld
