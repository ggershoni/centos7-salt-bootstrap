yum-cron_pkg:
  pkg:
    - name: yum-cron
    - installed

yum-cron_service:
  service.running:
    - name: yum-cron
    - enable: True
    - require:
      - yum-cron_pkg
    - watch:
      - file: /etc/yum/yum-cron.conf

yum-cron.conf-update_cmd:
  file.line:
    - name: /etc/yum/yum-cron.conf
    - content: 'update_cmd = security'
    - match: 'update_cmd = default'
    - mode: replace
    - require:
      - yum-cron_pkg

yum-cron.conf-apply_updates:
  file.line:
    - name: /etc/yum/yum-cron.conf
    - content: 'apply_updates = yes'
    - match: 'apply_updates = no'
    - mode: replace
    - require:
      - yum-cron_pkg
