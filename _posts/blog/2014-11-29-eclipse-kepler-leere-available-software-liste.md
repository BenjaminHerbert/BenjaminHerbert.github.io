---
layout: post
title: "Eclipse Kepler - Workaround für leere Liste bei verfügbarer Software"
modified:
categories: blog
excerpt:
tags: [eclipse,fix,bug]
author: benjamin_herbert
---

Eclipse Kepler - Workaround - Anzeigefehler bei Available Software beheben
====================================================

Bis vor einiger Zeit nutzte ich Eclipse Kepler um Software zu entwickeln. Eclipse
nutze ich seit vielen Jahren nahezu täglich sowohl im Berufsleben als auch für
diverse private Projekte.

Ab und zu gibt es einen relativ nervigen Fehler, der verhindert, dass bei der Installation von Plugins
etwas im Fenster "available software list" angezeigt wird. Man kann dann zwar immer
noch "Select All" wählen und auf gut Glück installieren. Sinnvoller ist es aber
natürlich sich auch anschauen zu können, womit man sein System erweitert.

Ursache scheinen zwei fehlerhafte Konfigurationseinträge zu sein, wenn man die Suche abbricht.
In dem zugehörigen [Bugeintrag bei Eclipse.org](https://bugs.eclipse.org/bugs/show_bug.cgi?id=355955#c16 wird ein Workaround vorstellt, der einwandfrei
funktioniert.

Man schließt dazu zunächst Eclipse und öffnet die Datei: ```(workspace)/.metadata/.plugins/org.eclipse.equinox.p2.ui/dialog_settings.xml```
Dort löscht man die folgenden beiden Zeilen

    <item value="0" key="AvailableVersionColumnWidth"/>
    <item value="0" key="AvailableNameColumnWidth"/>

Nach einen Neustart funktioniert Eclipse dann wieder wie gewünscht und zeigt die
vorhandenen Einträge korrekt an.
