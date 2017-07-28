---
layout: post
title: "Nginx Konfigurationsdateien prüfen"
modified: 2017-07-28
tags: [linux, nginx]
categories: blog
excerpt:
author: benjamin_herbert

---

Nach einer Änderung an den nginx-Konfigurationsdateien sollte man auf jeden Fall erstmal prüfen,
ob die geänderten Dateien auch fehlerfrei sind. Sonst kann nginx nicht starten.

Dazu leistet der Befehl `nginx -t` gute Dienste.

Das gibt dann, wenn die Konfiguration _korrekt_ ist sowas aus:

```bash
# nginx -t
nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
nginx: configuration file /etc/nginx/nginx.conf test is successful
```

Im _Fehlerfall_ wird eine mehr oder weniger detaillierte Fehlermeldung angezeigt, zum Beispiel diese hier:

```bash
# nginx -t
nginx: [emerg] unknown directive "-dfhg" in /etc/nginx/nginx.conf:4
nginx: configuration file /etc/nginx/nginx.conf test failed
```

Das hilft nicht immer gleich den Fehler zu finden, vor allem wenn andere Dateien mit _include_ eingebunden sind.
Aber auch hier gibt es eine kleine Hilfestellung.

## Welche Konfigurationsdateien sind denn gerade aktiv?

nginx bietet neben dem Schalter `-t` auch noch den Schalter `-T`.
Dann wird zusammen mit der Prüfung auch noch die komplette Konfiguration ausgegeben.

Filtert man dann zum Beispiel nach 'configuration file' bekommt man eine schöne Liste aller aktiven Konfigurationsdateien:

```bash
# nginx -T  | grep -F 'configuration file'
nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
nginx: configuration file /etc/nginx/nginx.conf test is successful
# configuration file /etc/nginx/nginx.conf:
# configuration file /etc/nginx/modules-enabled/10-mod-http-ndk.conf:
# configuration file /etc/nginx/modules-enabled/50-mod-http-auth-pam.conf:
# configuration file /etc/nginx/modules-enabled/50-mod-http-cache-purge.conf:
# configuration file /etc/nginx/modules-enabled/50-mod-http-dav-ext.conf:
# configuration file /etc/nginx/modules-enabled/50-mod-http-echo.conf:
# configuration file /etc/nginx/modules-enabled/50-mod-http-fancyindex.conf:
# configuration file /etc/nginx/modules-enabled/50-mod-http-geoip.conf:
# configuration file /etc/nginx/modules-enabled/50-mod-http-headers-more-filter.conf:
# configuration file /etc/nginx/modules-enabled/50-mod-http-image-filter.conf:
# configuration file /etc/nginx/modules-enabled/50-mod-http-lua.conf:
# configuration file /etc/nginx/modules-enabled/50-mod-http-perl.conf:
# configuration file /etc/nginx/modules-enabled/50-mod-http-subs-filter.conf:
# configuration file /etc/nginx/modules-enabled/50-mod-http-uploadprogress.conf:
# configuration file /etc/nginx/modules-enabled/50-mod-http-upstream-fair.conf:
# configuration file /etc/nginx/modules-enabled/50-mod-http-xslt-filter.conf:
# configuration file /etc/nginx/modules-enabled/50-mod-mail.conf:
# configuration file /etc/nginx/modules-enabled/50-mod-nchan.conf:
# configuration file /etc/nginx/modules-enabled/50-mod-stream.conf:
# configuration file /etc/nginx/mime.types:
# configuration file /etc/nginx/conf.d/ssl.conf:
# configuration file /etc/nginx/sites-enabled/example.com-ssl.conf:
# configuration file /etc/nginx/sites-enabled/example.com.conf:
...
```




