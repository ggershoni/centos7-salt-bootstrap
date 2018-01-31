sshd_pkg:
  pkg:
    - name: openssh-server
    - installed

sshd_service:
  service.running:
    - name: sshd
    - enable: True
    - require:
      - sshd_pkg
    - watch:
      - file: /etc/ssh/sshd_config

# Don't allow root to log in via ssh
sshd_config-disable_root_login:
  file.line:
    - name: /etc/ssh/sshd_config
    - content: 'PermitRootLogin no'
    - mode: insert
    - after: '#PermitRootLogin yes'
    - require:
      - sshd_pkg

# Don't allow login with passwords only keys
sshd_config-disable_password_authentication:
  file.replace:
    - name: /etc/ssh/sshd_config
    - pattern: '^PasswordAuthentication yes'
    - repl: 'PasswordAuthentication no'
    - append_if_not_found: true
    - require:
      - sshd_pkg
