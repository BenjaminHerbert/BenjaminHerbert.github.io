---
layout: post
title: "systemd - ExecStart überschreiben - TLS mit Docker Daemon"
modified:
categories: blog
excerpt:
tags: [docker, security, linux, systemd]
author: benjamin_herbert
---

## systemd - Docker Daemon akzeptiert DOCKER_OPTS nicht

Beim Einrichten einer sicheren TLS-Verbindung zu meinem Docker-Daemon ist mir aufgefallen,
dass der docker.service DOCKER_OPTS nicht mehr berücksichtigt. 

Diese hatte ich als systemd Drop-In Unit in der Datei _/etc/systemd/system/docker.service.d/custom.conf_ geschrieben:

```
[Service]
Environment=DOCKER_OPTS=/usr/bin/dockerd -H=0.0.0.0:2376 --tlsverify --tlscacert=/etc/docker/ssl/ca.pem --tlscert=/etc/docker/ssl/server-cert.pem --tlskey=/etc/docker/ssl/server-key.pem
```

Leider werden diese unter systemd gar nicht übergeben, wenn dockerd gestartet wird:

```
ExecStart=/usr/bin/dockerd -H fd://
```

`DOCKER_OPTS` scheint [nur für sysvinit oder upstart gedacht zu sein](https://github.com/docker/docker/blob/master/contrib/init/upstart/docker.conf#L42). 

## systemd - ExecStart überschreiben mit Drop-In
Ich habe das Drop-In so konfiguriert, dass es `ExecStart=` überschreibt.

Mein naiver (fast richtiger) Ansatz war folgender: 

```
ExecStart=/usr/bin/dockerd -H=0.0.0.0:2376 --tlsverify --tlscacert=/etc/docker/ssl/ca.pem --tlscert=/etc/docker/ssl/server-cert.pem --tlskey=/etc/docker/ssl/server-key.pem
```

was seitens systemd mit

> docker.service has more than one ExecStart= setting, which is only allowed for Type=oneshot services. Refusing.

quittiert wurde.

## ExecStart zurücksetzen und überschreiben

Will man die Einstellung im Drop-in überschreiben, so muss man den Wert erst zurücksetzen:

>  If the empty string is assigned to this option, the list of commands to start is reset, prior assignments of this option will have no effect.
>
> -- Quelle: `[man systemd.service](https://www.freedesktop.org/software/systemd/man/systemd.service.html)`


Will man also die Einstellungen überschreiben, so erstellt man folgendes Drop-In _/etc/systemd/system/docker.service.d/custom.conf_:


```
ExecStart=
ExecStart=/usr/bin/dockerd -H=0.0.0.0:2376 --tlsverify --tlscacert=/etc/docker/ssl/ca.pem --tlscert=/etc/docker/ssl/server-cert.pem --tlskey=/etc/docker/ssl/server-key.pem
```

Jetzt wird der in der ursprünglich angegebene ExecStart Wert zurückgesetzt und die Unit bzw. `/usr/bin/dockerd` wird in Zukunft mit den übergeben Parametern gestartet.

## Systeme ohne Systemd
 
Für Systeme ohne systemd kann auch die _daemon.json_ Datei genutzt werden, bei Systemd lässt sich aber kein `hosts`-Eintrag hinzufügen, genau den habe ich aber gebraucht.
 
> On systems that use systemd to start the Docker daemon, -H is already set, so you cannot use the hosts key in daemon.json to add listening addresses.
>
> -- Quelle: https://docs.docker.com/engine/reference/commandline/dockerd/#daemon-configuration-file



 
