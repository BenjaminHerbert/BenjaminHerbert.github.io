---
layout: post
title: "Refactoring von Jenkins Job DSL Code"
modified:
tags: [jenkins, refactoring]
categories: blog
excerpt:
author: benjamin_herbert

---

## Zusammenfassung

An einem einfachen Beispiel wird gezeigt wie man in der Job DSL Wiederholungen durch Methodenaufrufe ersetzen kann und gibt einen kurzen Einblick wie die Job DSL intern das _delegate_ Objekt verwendet und was man beim Refactoring beachten muss.

## Jenkins Job DSL

Bei einigen Projekten nutze ich das [Job DSL Plugin](https://wiki.jenkins-ci.org/display/JENKINS/Job+DSL+Plugin) um Jenkins Jobs zu definieren. Man beschreibt seine Jobs in einer DSL und das Job DSL Plugin generiert die entsprechenden Jenkins Jobs (bzw. config.xml Dateien). 

Das hat die üblichen Vorteile von Configuration as Code, darauf gehe ich in einem separaten Blogeintrag ein.

## Das Problem: Duplikate im Code

In einem Projekt hatte ich Job DSL Code, der sich häufig wiederholende Einträge enthielt, ungefähr wie in diesem Beispiel gezeigt:

{% gist BenjaminHerbert/71aca1fe3a1fcdb6de7bc390453b317c job-dsl-reuse-1.groovy %}

Mehrfach die gleichen Zeilen mit leicht veränderten "Goals"... unschön.

## DRY - Don't Repeat Yourself

Wiederholung erschwert die Übersichtlichkeit und Wartung, so dass ich üblicherweise (ab sich ca. dreimal wiederholenden Elementen) die Wiederholung eliminiere und durch z.B. einen Methodenaufruf ersetze. Bei der Job DSL ist das nicht so einfach machbar, man muss beachten, wie die Job DSL intern funktioniert: sie nutzt Closures und diese haben ein sogenanntes _delegate_ Objekt.

## Kleiner Exkurs: Groovy Delegates im Jenkins Job DSL Plugin

Jede Closure hat das sogenannte "delegate" Objekt. An jeweilige _delegate_ werden die Methodenaufrufe innerhalb der Closure geschickt. Dieser Mechanismus findet vor allem in Domain Specific Languages (DSL) Verwendung, so auch im Job DSL Plugin.

Normalerweise ist das _delegate_ auf den sogenannten ["owner"](http://groovy-lang.org/closures.html#_owner_of_a_closure) gesetzt, dieser zeigt auf das Objekt, das die Closure (direkt) enthält. Im Falle der Job DSL ist dies ein Objekt welches ein XML Element repräsentiert, auf dem die Methoden dann aufgerufen werden.

## Delegates und .with in der Job DSL

Will man also den Code aus der Job DSL extrahieren, so muss man darauf achten, dass die Methoden nach wie vor auf dem richtigen Delegate ausgeführt werden. Man muss das Delegate an die extrahierte Methode übergeben um auf die Job DSL Methoden zugreifen zu können. In der Methode nutzt man dann das Groovy [`.with` Konstrukt](http://groovy-lang.org/style-guide.html#_using_with_for_repeated_operations_on_the_same_bean). Das heißt, man muss beim extrahieren einer Methode das _delegate_ als Parameter übergeben: 

{% gist BenjaminHerbert/71aca1fe3a1fcdb6de7bc390453b317c job-dsl-reuse-2.groovy %}

Hier habe ich die Funktion `addMavenGoal` extrahiert, die einen Parameter `context` hat. Dann wird der extrahierte Code innerhalb von `context.with {}` mit dem passenden Delegate ausgeführt. 

In Zeile 12 und 13 sieht man den Funktionsaufruf und die Übergabe des `delegate`-Objekts an die extrahierte Funktion.

## Letzter Schritt

Der Vollständigkeit halber sollte natürlich noch die Maven-Version ausgelagert werden, da man dann bei einer Änderung der Maven-Version nur eine Stelle im Code verändern muss.

{% gist BenjaminHerbert/71aca1fe3a1fcdb6de7bc390453b317c job-dsl-reuse-3.groovy %}







