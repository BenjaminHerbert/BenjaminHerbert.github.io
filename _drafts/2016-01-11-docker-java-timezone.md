---
layout: post
title: "Docker Timezone und Java"
modified:
tags: [java, docker, linux]
categories: blog
excerpt:
author: benjamin_herbert

---

## Docker Timezones

Vor einiger Zeit hatte ich den Fall, dass innerhalb eines Docker-Containers die falsche Zeitzone eingestellt war. Das hat damit zu tun, dass
Docker Containern eine eigene "interne" Zeitzone haben und nicht die des Host-OS nehmen.

```
> date
Mon Jan 11 16:32:51 CET 2016
```


```
> docker run --rm busybox date
Mon Jan 11 15:32:30 UTC 2016
```


Wie man sieht, ist der Unterschied eine Stunde, im Container ist anscheinend UTC als ~~Zeitzone~~ Standard konfiguriert (Coordinated Universal Time). Auf dem Host jedoch CET (Central European Time) als Zeitzone.

In Linux-Containern lässt sich das relativ leicht beheben indem man die Datei `/etc/localtime` aus dem Host in den Container mounted. Das gleicht die Zeitzone des Containers an die des Hosts an. Da der Container nicht 
auf die Datei schreiben können soll, fügt man `:ro` hinter den Aufruf an: `-v /etc/localtime:/etc/localtime:ro`. (Das `ro` steht für *read-only*)
Der Aufruf wäre dann für das obige Beispiel:

```
> docker run --rm -v /etc/localtime:/etc/localtime:ro busybox date
Mon Jan 11 16:33:02 CET 2016
```

Siehe hierzu auch: https://github.com/docker/docker/issues/3359

Das ganze wurde noch etwas vertrackter, da innerhalb des Containers dann eine JVM immernoch die falsche Zeit angezeigt hat.

## JVM Timezones

Der Container hatte zwar die richtige Zeitzone, aber innerhalb der JVM wurde nicht die richtige Zeitzone aufgelöst.

Oracle hatte hierzu wenig hilfreiche Information https://docs.oracle.com/javase/8/docs/technotes/guides/troubleshoot/time-zone.html

Der offizielle Lösungsweg ist, ein JVM-Argument `user.timezone` mitzugeben und dort den richtigen Eintrag anzugeben. Beispielsweise für Deutschland: `Europe/Berlin`:

Es gibt jedoch auch einen einfacheren Weg, denn die Umgebungsvariable TZ wird ebenfalls ausgewertet. Diese kann einfach beim Start eines Containers mitgegegeben werden:

```
docker run -e TZ="Europe/Berlin" # ...
```

Das hat für unseren Anwendungsfall ausgereicht um innerhalb der JVM die korrekte Default TimeZone zu erhalten.





docker run --rm busybox date
docker run --rm -v /etc/localtime:/etc/localtime  busybox date
FILE=$(mktemp) ; echo $FILE ; echo -e "Europe/Berlin" > $FILE ; docker run --rm -v $FILE:/etc/timezone -v /usr/share/zoneinfo/Europe/Berlin:/etc/localtime busybox date


Windows Native Implementation
http://hg.openjdk.java.net/jdk8/jdk8/jdk/file/687fd7c7986d/src/windows/native/java/util/TimeZone_md.c
http://hg.openjdk.java.net/jdk8/jdk8/jdk/file/687fd7c7986d/src/share/native/java/util/TimeZone.c

