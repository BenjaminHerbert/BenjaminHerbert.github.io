---
layout: post
title: "Dual-Monitor unter Kubuntu"
modified:
categories: blog
excerpt:
tags: [linux]
author: benjamin_herbert
---

# Kubuntu - Dual-Monitor einrichten

Nach einiger Zeit habe ich mich endlich entschieden welchen zweiten Monitor ich
mir zulege. Die Wahl ist auf den [Samsung SyncMaster SA850D](http://goo.gl/pxN26p)
gefallen.

Das aktuelle Ubuntu 14.04 hat den Monitor direkt erkannt und mit der richtigen
Auflösung angesteuert. Leider gab es nach einigen Minuten einen Fehler und es war
kein Dual-Monitor-Betrieb mehr möglich.

Das Programm *xrandr* kann hier helfen.

Der Aufruf von ```xrandr``` ohne Parameter hilft zu Information über die installierten
Monitore:

    > xrandr
    Screen 0: minimum 320 x 200, current 4240 x 1440, maximum 8192 x 8192
    HDMI-0 disconnected (normal left inverted right x axis y axis)
    DVI-0 connected primary 2560x1440+0+0 (normal left inverted right x axis y axis) 518mm x 324mm
       2560x1440      60.0*+
       1920x1200      60.0
       1920x1080      60.0     50.0     59.9
       1600x1200      60.0
       1680x1050      59.9
       1280x1024      75.0     60.0
       1440x900       59.9
       1280x960       60.0
       1280x800       59.9
       1152x864       75.0
       1280x720       60.0     50.0     59.9
       1024x768       75.1     70.1     60.0
       832x624        74.6
       800x600        72.2     75.0     60.3     56.2
       720x576        50.0
       720x480        60.0     59.9
       640x480        75.0     72.8     66.7     60.0     59.9
       720x400        70.1
    VGA-0 connected 1680x1050+2560+0 (normal left inverted right x axis y axis) 474mm x 296mm
       1680x1050      60.0*+
       1280x1024      75.0     60.0
       1280x960       60.0
       1152x864       75.0
       1024x768       75.1     70.1     60.0
       832x624        74.6
       800x600        72.2     75.0     60.3     56.2
       640x480        75.0     72.8     66.7     60.0
       720x400        70.1

Hier sieht man, zwei Monitore, DVI-0 und VGA-0.

Bei mir steht der VGA-0 Monitor rechts und der andere links. Mit `xrandr` kann
man dies nun konfigurieren:

```
xrandr --output DVI-0 --auto --primary --output VGA-0 --right-of DVI-0 --auto
```

Der Befehl stellt die Ansteuerung der Monitore ein und dank des `--auto` Parameters
ist die Auflösung der Monitore auf das jeweilige Optimum eingestellt. Der Desktop
wird auf beide Monitore erweitert.

Mit `--primary` gibt man an, welcher Monitor der Hauptmonitor ist. Dort wird dann
zum Beispiel das Hauptmenü angezeigt.
