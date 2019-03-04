---
layout: post
title: "Maven - Einzelnen Test in Multimodule-Projekt ausführen"
modified:
categories: blog
excerpt:
tags: [maven, mvn, linux, junit, testing]
author: benjamin_herbert
---

# Maven

Die [Maven-Surefire-Anleitung](http://maven.apache.org/surefire/maven-surefire-plugin/examples/single-test.html) gibt an,
wie man einen einzelnen Unit-Test ausführt: 
```
mvn -Dtest=TestCircle test
```

Das hilft in einem Multimodul-Projekt aber nur bedingt weiter, denn dort bricht der Build ab mit dem Fehler:

> [ERROR] Failed to execute goal org.apache.maven.plugins:maven-surefire-plugin:3.0.0-M1:test (default-test) on project test-projekt: No tests were executed!  (Set -DfailIfNoTests=false to ignore this error.) -> [Help 1]

Um Abhilfe zu schaffen, muss man sogenannte **Advanced Reactor Options** setzen und das Modul angeben, in dem sich der Test befindet:

    mvn -Dtest=TestCircle --pl test-modul test
 
Dann wird nur der entsprechende Test ausgeführt.


