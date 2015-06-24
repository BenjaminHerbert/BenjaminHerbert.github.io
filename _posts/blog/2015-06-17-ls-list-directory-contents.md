---
layout: post
title: "ls - Verzeichnisinhalte auflisten"
modified:
categories: blog
excerpt:
tags: [linux]
author: benjamin_herbert
---

`ls` ist eines der am häufigsten benutzen Befehle unter Linux. In der Grundform
listet `ls` lediglich die im aktuellen Verzeichnis enthaltenen Dateien und Verzeichnisse auf.
Es wird sonst keinerlei Information angezeigt. Ebenfalls werden Inhalte, die mit *.* beginnen
ebenfalls nicht angezeigt. Mit `ls <Verzeichnis>` listet man den Inhalt von <Verzeichnis> auf.

## Ausführliche Information mit -l
Mit der Option `-l` gibt ls eine Vielzahl an Information aus. Dabei bedeuten die Spalten:

    > ls -l
    total 416K
    drwxr-xr-x 2 ben ben 4,0K Jun  9 19:15 Desktop/
    drwxr-xr-x 2 ben ben 4,0K May 14 05:43 Documents/
    drwxr-xr-x 3 ben ben 4,0K Jun 18 00:02 dotfiles/

* Berechtigungen
* Anzahl von Links
* Besitzer
* Besitzer-Gruppe
* Dateigröße
* Datun wann die Datei zuletzt geändert wurde
* Name der Datei/des Verzeichnisses

## Umgekehrte Reihenfolge

Mit der Option `ls -r` kann man die Reihenfolge umdrehen.

## Information über einzelne Verzeichnisse anlegen.
Ruft man beispielsweise `ls -l /tmp` auf, so wird der Inhalt von /tmp angezeigt.
Will man stattdessen lediglich die Information über /tmp als Verzeichnis ausgegeben haben, so hilft hier der Parameter -d weiter.


## Alias


