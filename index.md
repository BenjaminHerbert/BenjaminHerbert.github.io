---
layout: page
---

# &nbsp;
<div class="pull-right">

 <img src="images/bh.jpg" alt="Foto von Benjamin Herbert"/>

</div>

Ich bin Softwareentwickler mit einem Schwerpunkt auf dem Java Ökosystem. Ich habe mehr als 10 Jahre Erfahrung in der IT-Branche insbesondere in allen Phasen der Software- und Anwendungsentwicklung wie Konzeption, Implementierung, Testen, Releasemanagement und Betrieb gesammelt. 

Ich bin ein Anhänger der [Software-Craftsmanship-Bewegung](http://manifesto.softwarecraftsmanship.org/#/de) und handle nach dem Motto:

<cite>"How it is done is as important as having it done"</cite> - [@sandromancuso](https://twitter.com/sandromancuso)

Auf freiberuflicher Basis begleite ich Sie bei Ihren Projekten und kann Sie insbesondere bei den folgenden Themen unterstützen:

## Themen:
* Konzeption, Entwicklung und Test von Softwarelösungen in Java
* TDD / Test-Driven-Development
* Build Management
* Release Management
* Legacy Code / Refactoring
* Continuous Integration
* Continuous Delivery
* DevOps
* Software Craftsmanship

Ab **Januar 2015** bin ich wieder für Projekte verfügbar.

## Kontakt:

Diplom Inform. Benjamin Herbert<br />
Mailänder Straße 10 - 61<br />
60598 Frankfurt am Main<br />
E-Mail: mail AT herbert DOT cc<br />
Mobil: +49 163 8377921<br />

## Neuste Blogeinträge:

<ul class="post-list">
{% for post in site.posts limit:10 %} 
  <li><article><a href="{{ site.url }}{{ post.url }}">{{ post.title }} <span class="entry-date"><time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%B %d, %Y" }}</time></span></a></article></li>
{% endfor %}
</ul>
