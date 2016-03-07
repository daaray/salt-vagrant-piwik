apache2:
  pkg:
    - purged

php5-fpm:
  pkg:
    - installed
  service.running:
    - watch:
      - pkg: php5-fpm
      - file: /etc/php5/fpm/php.ini
      - file: /etc/php5/fpm/pool.d/www.conf

/etc/php5/fpm/php.ini:
  file.managed:
    - source: salt://piwik/files/php5-fpm/php.ini
    - user: root
    - group: root
    - mode: 644

/etc/php5/fpm/pool.d/www.conf:
  file.managed:
    - source: salt://piwik/files/php5-fpm/pool.d/www.conf
    - user: root
    - group: root
    - mode: 644

php5-mysql:
  pkg.installed

php5-curl:
  pkg.installed

php5-gd:
  pkg.installed

php5-cli:
  pkg.installed

php5-geoip:
  pkg.installed
