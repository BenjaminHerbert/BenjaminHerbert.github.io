---
layout: post
title: "Maven settings.xml für alle Jobs ändern"
modified:
tags: [jenkins, groovy, script, maven]
categories: blog
excerpt:
author: benjamin_herbert

---

## Maven settings.xml

Nutzt man zum Beispiel ein eigenes Maven-Repository wie Artifactory oder Nexus, kann man dies in der `settings.xml` hinterlegen, wenn man es nicht in der jeweiligen `pom.xml` hinterlegen will. Das ist vor allem dann sinnvoll, wenn man ein zentrales Repository nutzt und _immer_ verwenden will, wie es oft bei größeren Firmen gemacht wird.

Diese Konfiguration liegt überlicherweise unter `${user.home}/.m2/settings.xml` bzw unter `$M2_HOME/conf/settings.xml`.


## Verteilte Builds und settings.xml

Nutzt man die Möglichkeit auf Slaves zu arbeiten, so muss die settings.xml dort vorhanden sein bzw. genutzt werden. Eine Variante ist, die zu nutzende settings.xml auf die slaves an einen der obigen Orte zu kopieren.
Das bringt den Nachteil, dass man dafür sorgen muss, dass jeweils die richtige settings.xml dort liegt.

Eine andere Variante ist es, Jenkins dafür sorgen zu lassen, dass Maven die richtige Konfiguration erhält.
Das hat den Vorteil, dass man pro Job immer die "richtige" Datei parat hat.
Dazu kann man das [Config File Provider Plugin](https://wiki.jenkins-ci.org/display/JENKINS/Config+File+Provider+Plugin) nutzen.

Es ermöglicht Maven Konfigurationsdateien auf Jenkins zu hinterlegen und in einem Job z.B. bei den Maven-Schritten unter "Advanced..." anzugeben, dass die zur Verfügung gestellte `settings.xml` genutzt werden soll.

Dann wird bei einem Build die auf dem Master konfigurierte Datei auch auf dem Slave genutzt.

## Jenkins Jobs nachträglich ändern

Will man _bereits bestehende_ Jobs ändern, so dass eine in Maven konfigurierte `settings.xml` genutzt wird, bietet sich die [Jenkins Script Console](https://wiki.jenkins-ci.org/display/JENKINS/Jenkins+Script+Console) an.

Hat man eine `settingsConfigId`, so kann man mit folgendem Groovy-Skript den `SettingsProvider` finden.

{% gist BenjaminHerbert/16aaf0aed1a5fce4ec42 %}

Was man macht, ist sich anhand der ID eine neue MvnGlobalSettingsProvider-Instanz zu erzeugen. Dann setzt man mit der Methode [`http://javadoc.jenkins-ci.org/hudson/maven/MavenModuleSet.html#setGlobalSettings(jenkins.mvn.GlobalSettingsProvider)`](http://javadoc.jenkins-ci.org/hudson/maven/MavenModuleSet.html#setGlobalSettings(jenkins.mvn.GlobalSettingsProvider)) den jeweiligen `GlobalSettingsProvider` auf die erzeugte Instanz.

`MavenModuleSet`s stellen die üblichen Jenkins-Maven-Projekte dar. Diese können auch sogenannte PreBuilder haben. Die innere Schleife zeigt, wie man über diese iteriert und falls es sich hier auch um `Maven`-Tasks handelt, ändert.

