---
layout: page
title: DevOps und Platform Engineering & Kubernetes-Beratung
description: Freiberuflicher Platform Engineer aus Frankfurt am Main - Kubernetes, GitOps, Cloud, Infrastructure as Code und CI/CD für Plattform-Teams. Remote in DE und EU.
tags: [devops,cloud,iac,terraform,java,freelancer,freiberufler,it-beratung,software,ci,cd,aks,eks]
last_modified_at: 2025-01-25 10:14:00 +0100
---

## Platform Engineering, Kubernetes

Unternehmen, die moderne Software entwickeln, brauchen mehr als nur eine funktionierende Cloud-Umgebung - sie brauchen eine robuste, sichere und automatisierte Plattform, die Entwicklungsteams beschleunigt, Risiken minimiert und den Betrieb vereinfacht.

Mein Fokus:

Ich plane, baue und automatisiere Ihre Cloud-Infrastruktur mit Infrastructure as Code (IaC). Ob Entwicklungsplattformen, Kubernetes-Cluster oder unternehmensweite Cloud-Architekturen - ich sorge dafür, dass Ihre Teams effizient arbeiten können und Ihre Systeme stabil, sicher und wartbar bleiben.

Mehr dazu im [Portfolio]({{ site.url }}/portfolio/).

## Wie ich Sie unterstütze

* Planung und Aufbau Ihrer Cloud-Architektur - Sicher, skalierbar und kosteneffizient
* Automatisierung mit IaC - OpenTofu/Terraform, Terragrunt & GitOps für reproduzierbare Umgebungen
* Entwicklungsplattformen und CI/CD - Stabile und sichere Umgebungen für Entwicklerteams
* Kubernetes & Container-Orchestrierung - Kubernetes auf AKS, EKS oder On-Premise als strategische Plattform
* Montoring - Grafana, Prometheus und generelle Observability
* Sicherheit und Compliance - Zero-Trust, Secret Management, Policy-as-Code (z.B. OPA)
* Kostenoptimierung & Skalierung - Effiziente Ressourcennutzung, bedarfsgerechte Skalierung und Cloud-Kostenkontrolle

## Technologien & Expertise

Mit über 20 Jahren Erfahrung in Softwareentwicklung (insbesondere Java) und DevOps-Themen unterstütze ich Unternehmen bei der Transformation in die Cloud.

* **Kubernetes** (z.B. AKS, EKS, k3s, On-Prem)
* **Cloud & Hybrid Infrastrukturen** (Azure, AWS)
* **Infrastructure as Code** (OpenTofu, Terraform & Terragrunt, Ansible)
* **Sicherheits- und Compliance-Automatisierung** (Secret Management, Security Scanning, Policy-as-Code)
* **Monitoring & Observability** (Prometheus, Grafana, Elasticsearch)
* **Softwareentwicklung & Architektur** (Java, Microservices, CI/CD)
* **GitOps & Automatisierung** (ArgoCD, Flux, Jenkins, GitHub Actions)
* **Skalierung und Kostenoptimierung** (Auto-Scaling, Workload-Optimierung)

Mein Schwerpunkt liegt dabei auf [Kubernetes](https://www.herbert.cc/tags/#kubernetes), DevOps, Infrastructure-as-Code (IaC) und [Cloud](https://www.herbert.cc/tags/#cloud).

Als Anhänger der [Software-Craftsmanship-Bewegung](http://manifesto.softwarecraftsmanship.org/#/de)
handle ich nach dem Motto:

<cite>"How it is done is as important as having it done"</cite> - [@sandromancuso](https://twitter.com/sandromancuso)

## Remote. Transparent. Auf Enterprise-Niveau.

Ich arbeite **remote** und unterstütze Unternehmen, die nachhaltige, sichere und automatisierte Cloud-Infrastrukturen aufbauen wollen.

Kontaktieren Sie mich per E-Mail - ich freue mich über Anfragen von Unternehmen.

## Aus dem Blog: Kubernetes & Cloud

{% assign shown = 0 %}
<ul class="post-list">
{% for post in site.posts %}{% if shown < 5 %}{% if post.tags contains 'kubernetes' or post.tags contains 'cloud' or post.tags contains 'azure' or post.tags contains 'docker' %}
  <li><article><a href="{{ site.url }}{{ post.url }}">{{ post.title }} <span class="entry-date"><time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%d.%B %Y" }}</time></span></a></article></li>
{% assign shown = shown | plus: 1 %}{% endif %}{% endif %}{% endfor %}
</ul>


## Kontakt

{% include address.html %}
E-Mail: {% include mail.html %}

Am schnellsten erreichen Sie mich per E-Mail. Telefonate gerne nach kurzer
Terminabstimmung.

Ihr
Benjamin Herbert

<small>Hinweise für [Vermittler und Agenturen]({{ site.url }}/fuer-vermittler/).</small>
