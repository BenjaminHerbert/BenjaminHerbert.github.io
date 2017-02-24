---
layout: post
title: "Docker Timezone und Java"
modified: 2017-02-08
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

Wie man sieht, ist der Unterschied eine Stunde, im Container ist anscheinend UTC als <strike>Zeitzone</strike> Standard konfiguriert (Coordinated Universal Time). Auf dem Host jedoch CET (Central European Time) als Zeitzone.

In Linux-Containern lässt sich das relativ leicht beheben indem man die Datei `/etc/localtime` aus dem Host in den Container mounted. Das gleicht die Zeitzone des Containers an die des Hosts an. Da der Container nicht auf die Datei schreiben können soll, fügt man `:ro` hinter den Aufruf an: `-v /etc/localtime:/etc/localtime:ro`. (Das `ro` steht für *read-only*)
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
docker run -e TZ="Europe/Berlin" ... 
{% endhighlight %}

Das hat für unseren Anwendungsfall ausgereicht um innerhalb der JVM die korrekte Default TimeZone zu erhalten.

### Selbst ausprobieren

In einem Ordner folgenden Inhalt in eine Datei TZ.java kopieren:

{% highlight java  %}
public class TZ {
    public static void main(String[] args) {
        System.out.println("user.timezone: " + System.getProperty("user.timezone"));
        System.out.println("JVM: " + java.util.TimeZone.getDefault().getID());
    }
}
{% endhighlight %}

### Keine Zeitzone setzen

Starten wir einen Docker-Container und rufen dann unser kleines Programm auf:
{% highlight console %}
> docker run --rm -v /etc/localtime:/etc/localtime:ro -v $(pwd):/tz -it openjdk:8-jdk /bin/sh -c "cd /tz && javac TZ.java  && java TZ && rm TZ.class"
JVM: Etc/UTC
{% endhighlight %}
Wie man sieht ist der Container ist auf UTC gesetzt.

### Zeitzone über Environment-Variable TZ setzen

Setzen wir eine Zeitzone mit `-e TZ=Europe/Berlin`
{% highlight console %}
> docker run --rm -v /etc/localtime:/etc/localtime:ro -e TZ=Europe/Berlin -v $(pwd):/tz -it openjdk:8-jdk /bin/sh -c "cd /tz && javac TZ.java  && java TZ && rm TZ.class"
JVM: Europe/Berlin
{% endhighlight %}

Das Ergebnis ist wie gewünscht _Europe/Berlin_

Setzen wir eine nicht existierend Zeitzone als TZ:
{% highlight console %}
> docker run --rm -v /etc/localtime:/etc/localtime:ro -e TZ=FUU -v $(pwd):/tz -it openjdk:8-jdk /bin/sh -c "cd /tz && javac TZ.java  && java TZ && rm TZ.class"
JVM: GMT
{% endhighlight %}

### user.timezone

Nutzen wir das Property user.timezone erhalten wir folgendes Ergebnis
{% highlight console %}
> docker run --rm -v /etc/localtime:/etc/localtime:ro -v $(pwd):/tz -it openjdk:8-jdk /bin/sh -c "cd /tz && javac TZ.java  && java -Duser.timezone=Europe/Berlin TZ && rm TZ.class"
JVM: Europe/Berlin
{% endhighlight %}

Interessanterweise ist es egal ob man einen ungültigen TZ-Wert mitgibt, wie man im nächsten Abschnitt sieht.

### user.timezone und ungültiger TZ-Wert
{% highlight console %}
> docker run --rm -v /etc/localtime:/etc/localtime:ro -e TZ=fuu -v $(pwd):/tz -it openjdk:8-jdk /bin/sh -c "cd /tz && javac TZ.java  && java -Duser.timezone=Europe/Berlin TZ && rm TZ.class"
JVM: Europe/Berlin
{% endhighlight %}
### TZ und user.timezone gleichzeitig? user.timezone gewinnt

Setzt man mit `-Duser.timezone` eine unterschiedliche Zeitzone, so hat TZ keinen Effekt.

{% highlight console %}
> docker run --rm -v /etc/localtime:/etc/localtime:ro -e TZ=Europe/London -v $(pwd):/tz -it openjdk:8-jdk /bin/sh -c "cd /tz && javac TZ.java  && java -Duser.timezone=Europe/Berlin TZ && rm TZ.class"
JVM: Europe/Berlin
{% endhighlight %}

### Ungültige Parameter für user.timezone
Setzt man einen ungültigen Parameter, so wird _GMT_ genutzt, obwohl ein gültiger Wert für TZ gesetzt wurde.
{% highlight console %}
> docker run --rm -v /etc/localtime:/etc/localtime:ro -e TZ=Europe/London -v $(pwd):/tz -it openjdk:8-jdk /bin/sh -c "cd /tz && javac TZ.java  && java -Duser.timezone=Fuu TZ && rm TZ.class"
JVM: GMT
{% endhighlight %}

## Fazit
Die Grundeinstellung für Container ist UTC. Die Zeitzone kann man durch Umgebungsvariablen und durch Properties ändern. 

Wenn _user.timezone_ gesetzt ist, wird es auch ausgewertet. Das heißt: setzt man die Umgebungsvariable TZ und _user.timezone_, so hat TZ keinen Einfluss.

Wenn user.timezone fehlerhaft ist, wird das als GMT interpretiert.

