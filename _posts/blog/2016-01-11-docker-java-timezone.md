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

{% highlight console %}
> date
Mon Jan 11 19:22:38 CET 2016
{% endhighlight %}

Das Kommando im Container ergibt aber:

{% highlight console %}
> docker run --rm busybox date
Mon Jan 11 18:22:54 UTC 2016
{% endhighlight %}

Wie man sieht, ist der Unterschied eine Stunde, im Container ist anscheinend UTC als ~~Zeitzone~~ Standard konfiguriert (Coordinated Universal Time). Auf dem Host jedoch CET (Central European Time) als Zeitzone.

In Linux-Containern lässt sich das relativ leicht beheben indem man die Datei `/etc/localtime` aus dem Host in den Container mounted. Das gleicht die Zeitzone des Containers an die des Hosts an. Da der Container nicht 
auf die Datei schreiben können soll, fügt man `:ro` hinter den Aufruf an: `-v /etc/localtime:/etc/localtime:ro`. (Das `ro` steht für *read-only*)
Der Aufruf wäre dann für das obige Beispiel:

{% highlight console %}
> docker run --rm -v /etc/localtime:/etc/localtime:ro busybox date
Mon Jan 11 19:23:08 CET 2016
{% endhighlight %}

Siehe hierzu auch: https://github.com/docker/docker/issues/3359

Das ganze wurde noch etwas vertrackter, da innerhalb des Containers dann eine JVM immernoch die falsche Zeit angezeigt hat.

## JVM Timezones

Der Container hatte zwar die richtige Zeitzone, aber innerhalb der JVM wurde nicht die richtige Zeitzone aufgelöst.

Oracle hatte hierzu wenig hilfreiche Information https://docs.oracle.com/javase/8/docs/technotes/guides/troubleshoot/time-zone.html

Der offizielle Lösungsweg ist, ein JVM-Argument `user.timezone` mitzugeben und dort den richtigen Eintrag anzugeben. Beispielsweise für Deutschland: `Europe/Berlin`:

Es gibt jedoch auch einen einfacheren Weg, denn die Umgebungsvariable TZ wird ebenfalls ausgewertet. Diese kann einfach beim Start eines Containers mitgegegeben werden:

{% highlight console %}
docker run -e TZ="Europe/Berlin" # ...
{% endhighlight %}

Das hat für unseren Anwendungsfall ausgereicht um innerhalb der JVM die korrekte Default TimeZone zu erhalten.
