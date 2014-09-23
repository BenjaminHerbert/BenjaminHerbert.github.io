---
layout: page
---

Ich bin Softwareentwickler und habe mehr als 10 Jahre Entwicklung allen Bereichen der Softwareentwicklung. Auf freiberuflicher Basis unterstütze ich Sie bei Ihren Projekten. Mein Schwerpunkt liegt im Java-Bereich und ich habe einen besonderen Schwerpunkt bei folgenden Themen:

## Themen:
* Konzeption, Entwicklung und Test von Softwarelösungen in Java
* TDD / Test-Driven-Development
* Build Management
* Release Management
* Legacy Code / Refactoring
* Continuous Integration, Continuous Delivery, DevOps
* Software Craftsmanship

Ab Januar 2015 bin ich wieder für Projekte verfügbar.


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