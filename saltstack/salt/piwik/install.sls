piwik:
  pkg.installed:
    - name: piwik

piwik-repo:
  pkgrepo.managed:
    - name: 'deb http://debian.piwik.org/ piwik main'
    - file: '/etc/apt/sources.list.d/piwik.list'
    - key_url: 'https://debian.piwik.org/repository.gpg'
    - gpgcheck: 1
    - require_in:
      - pkg: piwik
