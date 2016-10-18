---
layout: post
title: "rsync - Benutzer und Gruppen beim Kopieren ändern/zuordnen"
modified:
tags: [linux, rsync]
categories: blog
excerpt:
author: benjamin_herbert

---

## Kurzbeschreibung

Beim Kopieren mit rsync kann es notwendig sein, Benutzer und Gruppen anzupassen.

Dazu gibt es seit [rsync 3.1.0](https://download.samba.org/pub/rsync/src/rsync-3.1.0-NEWS)
die Optionen `--usermap` sowie `--groupmap`.

Will man beim Kopiervorgang den Besitzer der Datei von foo (Quellsystem) auf bar (Zielsystem)
ändern, so kann man dies wie folgt tun:

```
rsync --usermap=foo:bar Quelle... Ziel
```

## chown - Alle Dateien ändern

Will man den Benutzer und Gruppe für alle Dateien ändern, die man mit rsync überträgt,
kann man auch `--chown=user:group` nutzen.

D.h., für das oben genannte Beispiel wäre das:

```
rsync --chown=foo:bar Quelle... Ziel
```

