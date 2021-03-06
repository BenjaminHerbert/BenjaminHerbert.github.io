---
layout: post
title: "dnf/yum - Spezifische Version von kubectl installieren / downgrade"
modified:
categories: blog
excerpt:
tags: [linux, yum, dnf, kubernetes]
author: benjamin_herbert
---

## Kubernetes Client - kubectl

Für die Arbeit mit Kubernetes ist es wichtig, dass die Versionen von Master und
Client zusammenpassen. Je nach Version des Masters kann es notwendig sein,
Kubernetes unterstützt, dass der Client eine Minor-Version höher ist, als der
Master.

D.h., läuft der Master auf 1.14, kann man kubectl in Version 1.15 nutzen. Mit der
Client-Version 1.16 bewegt man sich aber außerhalb des "skews".


> Different components are expected to be compatible across different amounts of skew,
> all relative to the master version. Nodes may lag masters components by up to
> two minor versions but should be at a version no newer than the master; a client
> should be skewed no more than one minor version from the master, but may lead
> the master by up to one minor version. For example, a v1.3 master should work
> with v1.1, v1.2, and v1.3 nodes, and should work with v1.2, v1.3, and v1.4 clients.
>
> -- <cite>[Kubernetes Release Documentation][1]</cite>


## Alle Versionen von kubectl anzeigen

Der folgende Befehl lässt alle Versionen von kubectl in den Repositories anzeigen.

```
 dnf --showduplicates list kubectl
```

Aus der dann ausgegeben Liste, kann man sich mit

```
dnf install kubectl-1.14.8-0
```
die passende Kubernetes-Client-Version installieren.

[1]: https://github.com/kubernetes/community/blob/master/contributors/design-proposals/release/versioning.md#supported-releases-and-component-skew

