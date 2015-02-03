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

Will man in Maven einen einzelnen (JUnit)-Test laufen lassen, so gibt es einen
nützlichen Parameter, mit dem man einen einzelnen Test oder nur bestimmte Tests
laufen lassen will.

```
mvn -Dtest=cc.herbert.ExampleTest test
```
Dies lässt Maven ausschließlich die Testklasse ```cc.herbert.ExampleTest``` laufen.
Das ist sehr nützlich, wenn man schnelles Feedback zu einem bestimmten Teil benötigt.

## Test per Pattern auswählen

Darüber hinaus ist es auch möglich nur bestimmte Tests auszuführen, wenn man sich
beispielsweise an eine Naming-Convention hält. Hat man beispielsweise alle Integrations-Tests
den Suffix IT gegeben, so könnte man mit dem Befehl

```
mvn -Dtest=*IT test
```
lediglich die Integrationstests ausführen.

Natürlich sollte man ab und an alle Tests ausführen, die hier gezeigte Methode
ist aber hilfreich, wenn man nur eine Auswahl von Tests ausführen will. Das kann
auch der Fall sein, wenn man genau Eingrenzen kann, welche Tests man ausführen muss
weil die Seiteneffekte klar sind.

