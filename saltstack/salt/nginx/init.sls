nginx:
  pkg:
    - installed
  service.running:
    - watch:
      - pkg: nginx
      - file: /etc/nginx/nginx.conf
      - file: /etc/nginx/sites-available/piwik

remove_existing_conf:
  file.absent:
    - name: /etc/nginx/sites-enabled/default
    - require:
      - pkg: nginx

/etc/nginx/nginx.conf:
  file.managed:
    - source: salt://nginx/files/etc/nginx/nginx.conf
    - user: www-data
    - group: www-data
    - mode: 640


/etc/nginx/sites-available/piwik:
  file.managed:
    - source: salt://nginx/files/etc/nginx/sites-available/piwik.jinja
    - template: jinja
    - user: www-data
    - group: www-data
    - mode: 640


/etc/nginx/sites-enabled/piwik:
  file.symlink:
    - target: /etc/nginx/sites-available/piwik
    - require:
      - file: /etc/nginx/sites-available/piwik
