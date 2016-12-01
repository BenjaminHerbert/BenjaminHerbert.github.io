---
layout: page
title: Vorstellung
tags: [devops,java,freelancer,freiberufler,it-beratung,softwareentwicklung,software,consulting,continuous integration,tdd]
---

Berater für zeitgemäße, professionelle Softwareentwicklung, Automatisierung sowie Release-Engineering. 

Ich habe mehr als 11 Jahre Erfahrung in der IT-Branche in allen Phasen der Software- und Anwendungs- entwicklung wie Konzeption, Implementierung, Testen, Releasemanagement und Betrieb gesammelt. Mein Fokus liegt dabei auf dem *Java*-Ökosystem.

<div>
 <img src="images/bh.jpg" alt="Foto von Benjamin Herbert"/>
</div>

Als Anhänger der [Software-Craftsmanship-Bewegung](http://manifesto.softwarecraftsmanship.org/#/de)
handle ich nach dem Motto:

<cite>"How it is done is as important as having it done"</cite> - [@sandromancuso](https://twitter.com/sandromancuso)

Auf freiberuflicher Basis begleite ich Sie bei Ihren Projekten und kann Sie insbesondere bei den folgenden Themen unterstützen:

## Themen:
* Konzeption, Entwicklung und Test von Softwarelösungen in Java
* TDD / Test-Driven-Development
* Buildmanagement
* Releasemanagement
* Legacy Code / Refactoring
* Continuous Integration
* Continuous Delivery
* DevOps
* Software Craftsmanship
* Release-Engineering
* Build-Engineering
* Softwareentwicklung im Java Ökosystem
* Automatisierung von Build und Deployment
* Betrieb und Aufbau von Build-Infrastruktur

Für Projekte vor Ort (mit > 80% Auslastung) bin ich ab **Januar 2017** europaweit verfügbar, bevorzugt im Raum Frankfurt bzw. Rhein-Main. 
Eventuell kann Ihr Problem ja auch *remote* gelöst werden, kontaktieren Sie mich hierzu gerne - vorzugsweise per E-Mail.

## Kontakt:

{% include address.html %}
E-Mail: {% include mail.html %}
Mobil: {% include phone.html %}

## Neuste Blogeinträge:

<ul class="post-list">
{% for post in site.posts limit:10 %}
  <li><article><a href="{{ site.url }}{{ post.url }}">{{ post.title }} <span class="entry-date"><time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%B %d, %Y" }}</time></span></a></article></li>
{% endfor %}
</ul>
