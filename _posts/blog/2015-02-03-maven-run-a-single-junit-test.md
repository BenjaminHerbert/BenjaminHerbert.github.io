---
layout: post
title: "Maven Surefire Plugin - Nur ausgewählte Tests ausführen"
modified:
tags: [maven, java, junit, testing]
categories: blog
excerpt:
author: benjamin_herbert

---

## Nur einzelne Testklassen

Will man in Maven nur einen einzelnen (JUnit)-Test laufen lassen, so gibt es einen
nützlichen Parameter, der dies ermöglicht. So kann man nur einen einzelnen Test oder
nur ganz bestimmte Tests laufen lassen.

```
mvn -Dtest=cc.herbert.ExampleTest test
```
Dies lässt Maven ausschließlich die Testklasse ```cc.herbert.ExampleTest``` laufen.
Das ist sehr nützlich, wenn man schnelles Feedback zu dem Teil der Anwendung benötigt.

## Test per Pattern auswählen

Darüber hinaus ist es auch möglich nur Tests auszuführen, deren Name einem bestimmten Muster genügt.
Das ermöglicht es, nur bestimmte Tests auszuführen. Hält man sich beispielsweise an eine Namenskonvention, bei der man allen Integrations-Tests
den Suffix IT gibt, so kann man mit dem Befehl

```
mvn -Dtest=*IT test
```
lediglich die Integrationstests ausführen.

Natürlich sollte man zumeist alle Tests ausführen, um vor unerwünschten Seiteneffekten bewahrt zu werden.
Die hier gezeigte Methode ist aber hilfreich, wenn man nur eine Auswahl von Tests ausführen will.
Wenn man genau eingrenzen kann, welche Tests man ausführen muss, kann man so sehr
schnell Feedback erhalten.

