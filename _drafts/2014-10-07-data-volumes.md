---
layout: post
title: "Data Volumes"
modified:
categories: blog
excerpt:
tags: [docker]
author: benjamin_herbert
---

# Daten mit Daten-Containern verwalten

Ich beschäftige mich gerade sehr intensiv mit Docker und in diesem Beitrag geht
es um sogenannte Data-Container, genauer gesagt, ein Data-volume Container.

## Was ist eigentlich ein Docker Volume

Ein Volume ist ein spezielles Verzeichnis, was das Union File System umgeht und
deswegen verschiedene Dinge ermöglicht, was Persistenz und Datenaustausch angeht.
Änderungen werden sofort persistiert. Änderungen sind nicht Inhalt etwaiger Images.

## Data Volume Container

Man kann die Volumes eines Containers mit anderen Containern teilen und hat somit
Zugriff auf dessen Daten. Dieses Konzept nennt man
[Data Volume Container](https://docs.docker.com/userguide/dockervolumes/#creating-and-mounting-a-data-volume-container).

Wie man diese spezifiziert und nutzt soll das folgende Beispiel zeigen.

Container kann man auf zwei Arten anlegen:
1. Auf der Kommandozeile mit Hilfe von

    docker run --name data-container -v /var/volume1 -v /var/volume2 busybox echo data container
2. Mit Hilfe eines *Dockerfile*s

    FROM busybox
    MAINTAINER Benjamin Herbert <benjamin@herbert.cc>
    VOLUME ["/var/volume1", "/var/volume2"]
    CMD echo data container

Daraus baut man mit

    docker build -t data .

das Image und erstellt einen Container mit:

    docker run --name data-container data

Bei beiden Punkten verwende ich den Namen *data-container*, um den *Data Volume
Container* später zu referenzieren.

Als base habe ich [busybox](https://registry.hub.docker.com/_/busybox/) gewählt,
da der Container sehr schlank sein kann. Er stellt lediglich Volumes für andere
Container bereit.

Wo diese liegen, kann man sich mit:

    docker inspect -f '{{range $containerfolder, $hostfolder :=.Volumes}}{{$containerfolder}}-->{{$hostfolder}}{{println}}{{end}}' data-container

ansehen und erhält dann etwas in der Art:

    /var/volume1-->/var/lib/docker/vfs/dir/f67a402cf912690c29fb5b5b9798dcd272a0cbe9bd6470ad52a2d5db7d47233b
    /var/volume2-->/var/lib/docker/vfs/dir/c389af0e2247f8674dfc3a7e760041811fb4fd38465ae7f6392b42a5368c65aa

(Die Verzeichnisse heißen bei euch sicherlich anders.)

Diese Volumes kann man mit der Referenz ```--volumes-from <container>``` in
anderen Containern mounten:

    docker run --volumes-from data-container -i -t ubuntu /bin/bash

Nun stehen die Volumes des *data-container* dem gestarteten Ubuntu container zur
Verfügung. Jede Änderung wird persistiert.

## Daten des Container sichern

Man kann das Volume nutzen um eine Datensicherung bzw. Backup der Daten eines
Daten Volumes zu erstellen.

    docker run --rm --volumes-from data-container -v $PWD:/backup busybox tar cvf /backup/backup.tar /var/volume1 /var/volume2

Wir erstellen einen Container, der auf busybox basiert und nutzen darin die Volumes
von unserem **data-container**. Als Ausgabepfad benutzen wir den lokalen Ordner,
der in das /backup Verzeichnis des Containers gemountet wird. Wir nutzen das
Programm tar und archivieren die beiden angegebenen Volumes in die Archivdatei
backup.tar im lokalen Verzeichnis. Wir geben ```--rm``` an um zu verhindern, dass
das Dateisystem des Containers persistiert wird. Die Daten liegen ja weiterhin in
den Volumes vor und so können wir den Platz sparen und brauchen nicht später
aufräumen.

## Daten aktualisieren im Container / Backup einspielen

Haben wir ein Backup *backup.tar* im aktuellen Verzeichnis liegen, können wir
dieses auf ähnliche Weise wieder einspielen. Dazu nutzen wir ebenfalls wieder
einen Container und mounten die Volumes, die das Backup enthalten und den
Zielordner. Dort entpacken wir das Archiv, wieder mit Hilfe von *tar*:

    docker run --rm --volumes-from data-container -v $PWD:/backup busybox tar xvf /backup/backup.tar

in den Zielordner zurück. Die Daten sind sofort verfügbar in den anderen Images.
