---
layout: post
title: "Maven Exec Plugin - Java-Programm ausführen und Argumente übergeben"
---

Maven - Java-Programm ausführen und mehrere Argumente übergeben
=======================================================

Vor einer Weile gab es auf Stackoverflow die Frage *"Maven: How to run a .java file from command line passing arguments"*. [Meine Antwort darauf scheint recht hilfreich zu sein](http://stackoverflow.com/a/10108780/1153530), hier nochmal eine kurze Zusammenfassung in Deutsch, es ist ja nicht jeder der englischen Sprache mächtig.

Maven bietet die Möglichkeit mit Hilfe des [Exec Maven Plugin](http://mojo.codehaus.org/exec-maven-plugin/)s System- und Javaprogramme auszuführen.

Um ein Java-Programm auszuführen, gibt man als Parameter **exec.mainClass** die Klasse mit, die die main-Methode enthält. Ein Argument kann man optional mit **exec.args** an die Methode übergeben werden:

```
mvn exec:java -Dexec.mainClass="com.example.Main" [-Dexec.args="Argument1"] 
```

Dabei kann man auch *mehrere Argumente* angeben, dazu gibt man diese in **doppelten Anführungszeichen** an:

```
mvn exec:java -Dexec.mainClass="com.example.Main" -Dexec.args="Argument1 Argument2 Argument 3"
```

Wenn ein Argument selbst ein *Leerzeichen* enthält, muss man **einfache Anführungszeichen** verwenden. Das ganze sieht für das Argument "Argument mit Leerzeichen" dann so aus:

```
mvn exec:java -Dexec.mainClass="com.example.Main" -Dexec.args="'Argument mit Leerzeichen'"
```

