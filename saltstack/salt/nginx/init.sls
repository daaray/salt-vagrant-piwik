nginx:
  pkg:
    - installed
  service.running:
    - watch:
      - pkg: nginx
      - file: /etc/nginx/nginx.conf
      - file: /etc/nginx/sites-available/default


/etc/nginx/nginx.conf:
  file.managed:
    - source: salt://nginx/files/etc/nginx/nginx.conf
    - user: www-data
    - group: www-data
    - mode: 640


/etc/nginx/sites-available/default:
  file.managed:
    - source: salt://nginx/files/etc/nginx/sites-available/default.jinja
    - template: jinja
    - user: www-data
    - group: www-data
    - mode: 640


/etc/nginx/sites-enabled/default:
  file.symlink:
    - target: /etc/nginx/sites-available/default
    - require:
      - file: /etc/nginx/sites-available/default
