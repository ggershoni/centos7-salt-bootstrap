denyhosts:
  pkg:
    - installed
  service.running:
    - enable: True
    - require:
      - pkg: denyhosts
