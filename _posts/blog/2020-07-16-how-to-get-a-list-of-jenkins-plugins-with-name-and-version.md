---
layout: post
title: "Liste von Jenkins Plugins mit Namen und Version erstellen"
tags: [jenkins, groovy]
categories: blog
excerpt:
author: benjamin_herbert

---

## Jenkins Plugins auflisten

Seit mittlerweile über zehn Jahren betreue ich mehr oder weniger oft Jenkins-Installationen. Vor über vier Jahren habe ich auf Stackoverflow die Frage beantwortet:

> How to get a list of installed Jenkins plugins with name and version pair?

[Meine Antwort dort erklärt auf Englisch wie man die Jenkins-Plugins inklusive Versionsnummer ausgeben lassen kann.][1] Sie ist schon etwas in die Jahre gekommen, aber war für viele Menschen hilfreich. Es ist meine mit Abstand am höchsten bewertete Antwort.

Mein Standardwerkzeug damals wie heute ist die [Skript-Konsole][2] das Tool der Wahl. Einfach, fast immer erreichbar und sehr mächtig. Ausreichende Berechtigungen sind natürlich mal voraus gesetzt, aber ich nehme an, ihr habt Adminrechte, wenn ihr euch mit Plugins befasst.

Die Konsole ist unter `https://<jenkins-url>/script` erreichbar.

Mit dem Befehl
```groovy
Jenkins.instance.pluginManager.plugins
  .toSorted { it -> it.shortName }
  .each { plugin -> println ("${plugin.displayName} (${plugin.shortName}): ${plugin.version}") }

```
kann man die Liste der Plugins auf der Console ausgeben lassen. (Tipp: <kbd>Ctrl/Strg</kbd>+<kbd>↩</kbd> führt den Inhalt der Console aus, wenn man mit dem Cursor in der Textbox ist)

`toSorted` ist notwendig, da `plugins` eine `UnmodifiableRandomAccessList` ist und man hier nicht `sort` verwenden kann, da dieses die darunterliegende Collection verändert.

Die Sortierbedingungen und die Ausgabe lassen sich nach Belieben anpassen.

### Jenkins - plugins.txt

Das Kommando kann auch wunderbar genutzt werden um sich eine `plugins.txt` zu erstellen. Diese Datei kann man dann mit dem offiziellen Jenkins-Docker-Image nutzen und sich seinen Jenkins wiederherstellen. Dazu vielleicht in einem anderen Beitrag mehr.


[1] https://stackoverflow.com/a/35292719/1153530
[2] https://www.jenkins.io/doc/book/managing/script-console/