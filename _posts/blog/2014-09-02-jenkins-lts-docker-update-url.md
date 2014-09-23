---
layout: post
title: "Jenkins LTS Release - Docker Container Update URL"
author: benjamin_herbert
modified:
categories: blog
excerpt:
tags: [java,ubuntu]
author: benjamin_herbert
---

Ich beschäftige mich im Moment viel mit Jenkins CI und habe das große Glück mich auch mit Docker beschäftigen zu können. 

Vor ein paar Wochen wurde der offizielle Docker Jenkins Container vorgestellt, der auf der Jenkins LTS Version 1.565.1 basiert. Dabei ist mir aufgefallen, dass die update Seite der Plugins nicht korrekt auf die stable Seite verweist. Das sollte man ändern, da man sonst unter Umständen Plugins aktualisiert, die gar nicht mit der LTS Version von Jenkins zusammenpassen.

[Jenkins LTS - Plugin Update URL](/path/to/img.jpg "Optional title")

Die Einstellungen hiervon sind in dem Datencontainer von Jenkins gespeichert, in der Datei: *hudson.model.UpdateCenter.xml*:

    <?xml version='1.0' encoding='UTF-8'?>
    <sites>
      <site>
        <id>default</id>
        <url>http://updates.jenkins-ci.org/update-center.json</url>
      </site>
    </sites>


Dort sollte stattdessen die URL: *http://updates.jenkins-ci.org/stable/update-center.json* stehen, wie in der [LTS Release Line Dokumentation steht](https://wiki.jenkins-ci.org/display/JENKINS/LTS+Release+Line).

Da ich das nicht manuell ändern will, habe ich 







