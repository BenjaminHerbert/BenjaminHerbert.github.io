---
layout: post
title: "Distributionsinformation unter Linux ausgeben"
modified: 2019-06-03
categories: blog
excerpt:
tags: [linux]
author: benjamin_herbert
---
# Informationen aus /etc/os-release

Sucht man datei-basierte Information über die Linux-Version kann man diese in `/etc/os-release`finden.
Das Ergebnis ist eine mit Newline getrennte Liste von KEY=VALUE-Paaren, wie sie beispielsweise auch in Environment zu finden ist.

Mehr Information darüber gibt die manpage `man os-release`.

# Information über die Linux-Version mit lsb_release herausfinden

Linux bringt das hilfreiche Werkzeug `lsb_release` mit, mit dem man Information
über die aktuelle Distribution ausgeben kann.

Die möglichen Optionen des Befehls findet man heraus mit:

    > lsb_release -help
    Usage: lsb_release [options]
    Usage: lsb_release [options]
    
    Options:
      -h, --help         show this help message and exit
      -v, --version      show LSB modules this system supports
      -u, --upstream     show upstream LSB data
      -i, --id           show distributor ID
      -d, --description  show description of this distribution
      -r, --release      show release number of this distribution
      -c, --codename     show code name of this distribution
      -a, --all          show all of the above information
      -s, --short        show requested information in short format

Mit `lsb_release -a` wird am meisten Information ausgegeben und man findet recht
genau heraus, mit welchem System man es zu tun hat.

Hier eine *Beispielsausgabe* zweier Systeme:

    > lsb_release -a
    No LSB modules are available.
    Distributor ID:	LinuxMint
    Description:	Linux Mint 17.1 Rebecca
    Release:	17.1
    Codename:	rebecca

    > lsb_release -a
    No LSB modules are available.
    Distributor ID:	Ubuntu
    Description:	Ubuntu 14.04.2 LTS
    Release:	14.04
    Codename:	trusty

Unter Fedora ist das Programm in der Grundeinstellung nicht installiert,
kann aber mit `yum install redhat-lsb-core` oder `yum install redhat-lsb`
nachinstalliert werden.

Danach ergibt der Aufruf von `lsb_release -a` zum Beispiel:

    > lsb_release -a
    LSB Version:	:core-4.1-amd64:core-4.1-noarch:cxx-4.1-amd64:cxx-4.1-noarch:desktop-4.1-amd64:desktop-4.1-noarch:languages-4.1-amd64:languages-4.1-noarch:printing-4.1-amd64:printing-4.1-noarch
    Distributor ID:	Fedora
    Description:	Fedora release 20 (Heisenbug)
    Release:	20
    Codename:	Heisenbug


