---
layout: post
title: "Java unter Ubuntu installieren"
modified:
categories: blog
excerpt:
tags: [java,ubuntu]
author: benjamin_herbert
---

Java unter Ubuntu installieren
==============================

* [Herunterladen des JDK](http://www.oracle.com/technetwork/java/javase/downloads/index.html) und speichern nach ~/Downloads. Ich gehe davon aus, dass ein .tar.gz heruntergeladen wird.

```
cd ~/Downloads						# In den Download Ordner wechseln
tar xvzf jdk-8u5-linux-x64.tar.gz 			# Entpacken des Archivs
sudo mv jdk1.8.0_05 /usr/lib/jvm/			# Verschieben des Ordners
cd /usr/lib/jvm						# Wechseln in den Zielordner
ln -s jdk1.8.0_05 jdk1.8.0				# Symlinks anlegen
sudo update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk1.8.0/bin/java" 1
sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk1.8.0/bin/javac" 1
sudo update-alternatives --install "/usr/bin/javaws" "javaws" "/usr/lib/jvm/jdk1.8.0/bin/javaws" 1
sudo update-alternatives --config java	# Hier jeweils das neu installierte JDK8 auswählen
sudo update-alternatives --config javac 
sudo update-alternatives --config javaws
java -version				# Sollte *java version "1.8.0_05"* anzeigen
```

In der aktuellen unstable Version des Chrome Browsers gibt es anscheinend kein Java-Plugin mehr, bzw. noch nicht.

