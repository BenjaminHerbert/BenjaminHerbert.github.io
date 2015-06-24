---
layout: post
title: "Git-Commit-Ids in Jenkins mit Atlassian Stash verlinken"
modified:
categories: blog
excerpt:
tags: [jenkins,git]
author: benjamin_herbert
---

# Jenkins und Git - Git Plugin

In den meisten meiner Projekte wird derzeit Git als Sourcecodeverwaltung genutzt.
Dabei gibt es unterschiedliche Repositories. Im Open-Source-Bereich wird oft
GitHub eingesetzt, privat nutze ich sowohl GitHub als auch BitBucket.
Erfahrungen mit gitorious habe ich ebenfalls gemacht, daran erinnere ich mich aber
nur ungern zurück.

Der Continuous-Integration-Server Jenkins bietet über Plugins die Möglichkeit
SCM-Änderungen mit Hyperlinks zu versehen. Für Git ist dafür das
[Git Plugin](https://wiki.jenkins-ci.org/display/JENKINS/Git+Plugin) zuständig.

## Repository Browser

Um in Jenkins Links zu Source-Code-Änderungen zu sehen, muss man in den jeweiligen
Projekten angeben, welcher *Repository Browser* verwendet werden soll. Zusätzlich
muss spezifiziert werden, wie die URL innerhalb Stash ist, wo man sozusagen den
Stash Inhalt abrufen kann.

### Auto - funktioniert nicht für git

<cite>
In der Einstellung "Auto" versucht Jenkins, den Repository-Browser aus anderen
Jobs abzuleiten. Dazu muß das SCM des vorliegenden Jobs von einem Repository-Browser
unterstützt werden und ein anderer Job existieren, dessen Verbindung zu einem
solchen Repository-Browser bereits vollständig konfiguriert wurde.
</cite>

Wie genau die Auswahl (Auto) bei "Repository Browser" funktioniert hat sich mir nicht erschlossen,
laut der Beschreibung der Hilfe, sollte es in Jobs schauen, die das selbe Repository
verwenden.

[Anscheinend ist das nur für CVS implementiert](http://jenkins-ci.361315.n4.nabble.com/How-does-the-Auto-repository-browser-work-tp388654p388660.html).

Ein Testlauf mit zwei Git-Projekten bestätigt das Verhalten bei git: *es funktioniert
nicht* - man muss den passenden Repository-Browser in jedem Projekt einstellen.

## Jenkins und Atlassian Stash

Um Quellcode-Änderungen in Jenkins mit einem direkten Link zu Atlassian Stash zu verknüpfen,
muss man den korrekten Repository Browser einstellen und einen Link zu Stash angeben.

Das macht man in den Projekteinstellungen, unter Source-Code-Management bei Git
klickt man zunächst auf "Erweitert...".
Dann wählt man unter Repository Browser "stash" aus und trägt bei URL die URL ein
(ohne /browse).

Danach sind in Jenkins bei den jeweiligen Commits und bei Änderungen/Changes jeweils
die Details verlinkt und ein Link zu Stash mit dem man die genauen Änderungen aufrufen kann.

## Noch etwas mehr Technik

[Stash wird seit August 2012 vom Jenkins Git Plugin unterstützt](https://Github.com/jenkinsci/Git-plugin/pull/82).

Die Klasse `Stash` erweitert dabei die abstrakte Klasse `GitRepositoryBrowser`
und implementiert die Methoden:

    public URL getDiffLink(GitChangeSet.Path path) throws IOException
    public URL getFileLink(GitChangeSet.Path path) throws IOException

Diese Methoden stellen den Hyperlink zum Diff sowie den Hyperlink zu der Datei selbst bereit.

[Quellcode von Stash.java](https://github.com/jenkinsci/git-plugin/blob/3e65e1b7540ba49bcfda55fb770adfb3135a979a/src/main/java/hudson/plugins/git/browser/Stash.java)

