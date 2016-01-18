---
layout: post
title: "Maven - Plugins debuggen"
modified:
categories: blog
excerpt:
tags: [debug,eclipse,java,maven]
author: benjamin_herbert
---

Maven ist aufgrund seiner ausgefeilten Plugin-Architektur schon recht komplex. Da
kann es recht hilfreich sein, wenn man Maven-Plugins debuggen kann.

Das ist, seit Maven 2.0.8 ohne Probleme möglich indem man anstatt mvn 
*mvnDebug* aufruft.

Dann kann man das Maven-Projekt auf Port 8000 debuggen.

Dazu in Eclipse Run > Debug Configurations ... aufrufen und auf der linken Seite
*Remote Java Application* auswählen. Mit der rechten Maustaste eine neue Konfiguration
erstellen und passend ausfüllen.

Das wichtige Feld ist Connection Type, dort muss für mvnDebug dann *Standard (Socket Attach)* ausgewählt werden.
Im Feld *Host* muss, z.B. localhost ausgefüllt werden.

mvnDebug ist nur ein Skript, welches folgende Optionsvariablen vor einen normalen
mvn-Aufruf schreibt:

{% highlight text %}
    MAVEN_DEBUG_OPTS="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=8000"
{% endhighlight %}

Nicht vergessen einen Breakpoint im Plugin-Quelltext zu setzen und entsprechende
'goal' bzw. die 'phase' aufrufen.

*Happy debugging!*
