---
layout: page
---
<p>
<div class="pull-right">

 <img src="images/bh.jpg" alt="Foto von Benjamin Herbert"/>

</div>
</p>

Ich bin Freiberufler und arbeite als Berater für Softwareentwicklung. Mein Fokus
liegt dabei auf dem *Java*-Ökosystem. Ich habe mehr als 10 Jahre Erfahrung in der IT-Branche insbesondere in allen Phasen der Software- und Anwendungs- entwicklung
wie Konzeption, Implementierung, Testen, Releasemanagement und Betrieb gesammelt.

Als Anhänger der [Software-Craftsmanship-Bewegung](http://manifesto.softwarecraftsmanship.org/#/de)
handle ich nach dem Motto:

<cite>"How it is done is as important as having it done"</cite> - [@sandromancuso](https://twitter.com/sandromancuso)

Auf freiberuflicher Basis begleite ich Sie bei Ihren Projekten und kann Sie
insbesondere bei den folgenden Themen unterstützen:

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

Ab **Januar 2015** bin ich europaweit für Projekte vor Ort verfügbar. Falls ich
Sie *remote* oder per Telefon unterstützen kann, kontaktieren Sie mich vorzugsweise per E-Mail.

## Kontakt:

Dipl. Inform. Benjamin Herbert<br />
Mailänder Straße 10 - 61<br />
60598 Frankfurt am Main<br />
E-Mail: <a href="&#109;&#097;&#105;&#108;&#116;&#111;:&#098;&#101;&#110;&#106;&#097;&#109;&#105;&#110;&#064;&#104;&#101;&#114;&#098;&#101;&#114;&#116;&#046;&#099;&#099;?Subject=Anfrage" target="">
Benjamin (AT) Herbert (PUNKT) CC</a> <br />
Mobil: +49 163 8377921<br />

## Neuste Blogeinträge:

<ul class="post-list">
{% for post in site.posts limit:10 %}
  <li><article><a href="{{ site.url }}{{ post.url }}">{{ post.title }} <span class="entry-date"><time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%B %d, %Y" }}</time></span></a></article></li>
{% endfor %}
</ul>
