---
layout: post
title: "Open SSH Zertifikat Principals ansehen"
modified:
tags: [linux, openssh, security]
categories: blog
excerpt:
author: benjamin_herbert

---

## Kurzbeschreibung

Mit _OpenSSH Certificate Authentication__ hat man eine handhabbare Lösung, mit der
man nicht mehr Schlüssel/Keys zwischen Systemen herum kopieren muss. Stattdessen
signiert die Certificate Authority die signierten Client-Zertifikate.

Das signierte Zertifikat enthält die Information für wen und wo das Zertifikat
gültig ist.

Mit der CA wird dann beim einloggen untersucht, ob die Signatur valide ist und ob
man das Zertifikat dort nutzen darf.

## Information über das OpenSSH Client Zertifikat ausgeben
```
ssh-keygen -L -f user-foo-cert.pub
```

gibt die Information des Zertifikats aus.
