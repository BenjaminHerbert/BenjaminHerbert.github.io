---
layout: post
title: "Git Repository per SSH auf Server"
modified: 2017-07-27
tags: [git, ssh, linux]
categories: blog
excerpt:
author: benjamin_herbert

---

## Remote per SSH

Git kann man auch ohne Github, Gitlab oder ähnlichem verwenden. Hier beschreibe ich, 
wie man auf einem Server ein Repository anlegt und dieses als remote konfiguriert.

In unserem Beispiel soll /srv/git/repositories/test als Repository genutzt werden.

## Server einrichten

Man loggt sich per SSH auf dem Server ein und installiert dort git

```bash
apt-get install git # oder yum, etc.
```

## Gruppe gitusers anlegen

Ich lege eine neue Gruppe an um alle Benutzer als Git-Benutzer zu gruppieren:

```bash
groupadd gitusers
```

Dann füge ich meinen Benutzer _user_ zu dieser Gruppe hinzu:

```bash
usermod -a -G gitusers user
```

*Wichtig: das -a nicht vergessen, sonst wird die Gruppe nicht hinzugefügt,
sondern man ist dann nur noch in der Gruppe)
Das Verzeichnis /srv/git/repositories/test legen wir mit
```bash
mkdir -p /srv/git/repositories/test
```
und ändern dessen Gruppe und Berechtigungen:

```
chgrp gitusers /srv/git/repositories/test
chmod g+ws /srv/git/repositories/test
```
.

### setuid

Das `+s` setzt das sogenannte _setgid_ Bit, so dass die Gruppe `gitusers` vom Verzeichnis
geerbt wird. D.h., wenn ich als Benutzer eine andere primäre Gruppe habe und neue Dateien anlege,
erhalten diese die Gruppe gitusers und bleiben somit für alle Git-Benutzer (Mitglieder der Gruppe gitusers) les- und schreibbar.

### Das Git-Repository initialisieren

Wir müssen den Ordner initialisieren, dazu führen wir:

```bash
cd /srv/git/repositories/test
git init --bare --shared=group
```

Man sollte `shared` angeben, sonst werden die Berechtigungen u.U. nicht richtig vergeben,
da sonst einfach _umask_ verwendet wird.
(Kann man nachträglich mit `git config core.sharedRepository group` ändern.

## Git clone

Auf dem Client führt man dann dieses Kommando aus um zu klonen:

```bash
git clone git+ssh://user@example.com/srv/git/repositories/test
```

Das setzt natürlich eine funktionierende SSH-Verbindung voraus.
