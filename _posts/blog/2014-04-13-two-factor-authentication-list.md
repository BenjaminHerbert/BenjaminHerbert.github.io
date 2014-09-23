---
layout: post
title: "Two-Factor Authentification für Google, Dropbox, Github und co."
modified:
categories: blog
excerpt:
tags: [security]
author: benjamin_herbert
---

Accounts absichern mit Zwei-Faktor-Authentifizierung
====================================================

Zwei-Faktor-Authentifizierung ist sicherer als die herkömmliche Authentifizierung. Zusätzlich zum Passwort muss man bei diesem Verfahren noch etwas besitzen oder wissen.

Bei Google benutze ich schon länger diese Art der Authentifizierung. Neben dem Passwort muss man noch nachweisen, dass man das Smartphone besitzt, das für die Authentifizierung registriert wurde. Hierfür muss man einen Code eingeben, der mit der [Google Authenticator](https://play.google.com/store/apps/details?id=com.google.android.apps.authenticator2) App erzeugt wurde.

Das Video beschreibt ganz anschaulich, was bei der Google Zwei-Faktor-Authentifizierung zu beachten ist:

<iframe width="560" height="315" src="//www.youtube.com/embed/zMabEyrtPRg" frameborder="0"></iframe>


Nach dem [Heartbleed-Bug](http://heartbleed.com/) stand auf meiner To-do-Liste natürlich versch. Accounts abzusichern. Dabei bin ich auf die ["two-factor authentication list"](http://evanhahn.com/2fa/) gestoßen. Eine sehr hilfreiche Liste mit vielen Seiten im Netz und Information dazu, wo und wie man die Authentifizierung umstellen kann.

In meinem Fall war das zuallererst mal [Dropbox](https://www.dropbox.com/account/security) und [GitHub](https://github.com/settings/two_factor_authentication/intro), [Paypal](https://www.paypal.com/us/cgi-bin/webscr?cmd=_setup-security-key) sowie [Facebook](https://www.facebook.com/settings?tab=security). Twitter ging leider nicht, da noch keine Verbindung zu meinem Betreiber vorhanden ist und ich deren Anwendung nicht nutzen möchte. Sehr angenehm ist, dass man bei Dropbox und GitHub ebenfalls die Google Authenticator App einsetzen kann. Facebook und Paypal setzen hier auf SMS, die an das registrierte Telefon gesendet werden.