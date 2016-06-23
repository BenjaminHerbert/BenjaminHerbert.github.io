---
layout: post
title: "Jenkins-Builds in Eclipse IDE integrieren"
modified:
tags: [jenkins, eclipse, continuous integration, ide, mylyn]
categories: blog
excerpt:
author: benjamin_herbert

---

## Mylyn Builds - Integration von Jenkins

Eclipse bietet mit Mylyn ein ganzes Framework rund um Application Lifecycle
Management (ALM). Mit dem Connector 'Hudson/Jenkins Mylyn Builds Connector'
kann man sich auch mit Jenkins bzw. Hudson verbinden und diese in einem View
'Builds' anzeigen lassen. Dabei kann man auswählen, welche Jobs man angezeigt 
bekommt.

Man bekommt dann den Job-Namen, eine kurze Zusammenfassung sowie eine Spalte mit
dem letzten Build-Datum angezeigt.

Sehr praktisch ist die Anzeige des letzten Builds und der Statistik von z.B. JUnit-Tests,
diese kann man zum Beispiel mit Mylyn-Tasks verknüpfen, wenn man Jira, Bugzilla 
oder ähnliches verbindet und Bug-Kürzel einträgt.

[Mittlerweile kann das Plugin auch korrekt mit dem Cloudbees-Folder-Plugin umgehen](https://bugs.eclipse.org/bugs/show_bug.cgi?id=421352) 
und wirft hier keine Exception mehr.

