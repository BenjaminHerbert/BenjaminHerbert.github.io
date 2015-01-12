---
layout: post
title: "git Sprache auf Englisch stellen"
modified:
categories: blog
excerpt:
tags: [git,linux]
author: benjamin_herbert
---

# Kommandozeile - git Nachrichten auf Englisch anzeigen

Auf meinem System kam es - nachdem ich meine Systemsprache auf Deutsch eingestellt
habe - dazu, dass git auf der Kommandozeile bzw. Konsole sämtliche Meldungen ebenfalls
auf Deutsch angezeigt hat. Das ist, insbesondere im Falle von Fehlern oder Zuständen,
die man genauer untersuchen muss, sehr hindernd, da man viel weniger Suchtreffer
für die jeweiligen Fehlermeldungen erhält wenn diese nicht auf Englisch sind.

Um das zu verbessern habe ich in meiner `~/.bashrc` einen alias für git angelegt,
der die LANG Variable überschreibt.

```
alias git='LANG=en_US git'
```

Nach dem Speichern muss man die Datei mit `source ~/.bashrc` einlesen und von da
an sollte man wieder eine englische Version der Konsolenausgabe erhalten.

Ein [Artikel auf Stackoverflow][so1] merkt an, dass - sofern LC_ALL gesetzt ist - man
dann `alias git='LC_ALL=en_US git'` nutzen muss, da diese Vorrang gegenüber LANG
erhält.

[so1]: https://stackoverflow.com/questions/10633564/how-does-one-change-the-language-of-the-command-line-interface-of-git

