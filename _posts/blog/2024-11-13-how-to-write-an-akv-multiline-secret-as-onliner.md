---
layout: post
title: "Wie man ein Multi-Line secret in Azure Key Vault per Bash anlegt"
tags: [azure, bash, secret, akv]
categories: blog
excerpt:
author: benjamin_herbert

---

## Mehrzeilige Secrets in Azure per Bash und Heredoc anlegen – als Einzeiler
In der Cloud ist es oft notwendig, sensible Informationen wie Secrets, API-Schlüssel oder Zertifikate sicher zu speichern. Azure Key Vault bietet eine einfache Möglichkeit, solche Daten zu verwalten. Aber was, wenn das Secret aus mehreren Zeilen besteht und du nicht den Umweg über eine separate Datei nehmen willst, um zu vermeiden, dass der geheime Wert temporär in einer Datei gespeichert wird?

In diesem Beitrag zeige ich, wie du mithilfe eines Bash-Einzeilers und Heredoc ein mehrzeiliges Secret in Azure Key Vault ablegst. Wir generieren das Secret direkt in der Shell und laden es sicher hoch.

### Schritt 1: Azure CLI installieren und anmelden
Stelle sicher, dass du die Azure CLI installiert hast und du angemeldet bist:

```bash
az login
```

### Schritt 2: Erstelle das mehrzeilige Secret in Azure Key Vault
Im folgenden Einzeiler erstellen wir ein Secret im JSON-Format und speichern es direkt in Azure Key Vault:

```bash
az keyvault secret set --vault-name "<kv-name>" --subscription "<subscription>" --name "<secret-name>" --file <(cat <<EOF
{
"MY_SECRET": "$(openssl rand -hex 25)"
}
EOF
)
```

Erklärung des Einzeilers
`az keyvault secret set`: Dieser Befehl legt ein Secret im Azure Key Vault an. Wir geben den Namen des Key Vaults, 
die Azure Subscription und den Secret-Namen an.

Heredoc und JSON-Struktur: Mithilfe von `cat <<EOF ... EOF` fügen wir das mehrzeilige Secret im JSON-Format ein. Die JSON-Struktur erlaubt eine flexible Erweiterung, falls später mehr Einträge hinzugefügt werden sollen.

`openssl rand -hex 25`: Dieser Befehl generiert einen zufälligen hexadezimalen String mit 25 Bytes Länge, was 50 Zeichen entspricht. openssl rand ist ein Teil der OpenSSL-Bibliothek und wird häufig verwendet, um sichere Zufallswerte für Passwörter oder Secrets zu generieren. Das -hex-Flag sorgt dafür, dass der Wert hexadezimal ist – ideal für sichere Schlüssel.

### Warum openssl rand?

Der openssl rand-Befehl ist äußerst nützlich, um kryptographisch sichere Zufallswerte zu erzeugen. Die Länge von 25 Bytes (entspricht 200 Bits) ist für viele Anwendungen ausreichend sicher. Du kannst die Anzahl der Bytes anpassen, wenn du längere oder kürzere Werte benötigst. Mit openssl rand -hex 25 wird ein Wert erzeugt, der schwer zu erraten ist, was besonders wichtig für sensible Informationen wie API-Schlüssel und Passwörter ist.

### Ein paar Anmerkungen zur Sicherheit

**JSON und Struktur**: Die JSON-Struktur bietet eine übersichtliche Möglichkeit, Secrets zu speichern und kann in vielen Situationen nützlich sein, z.B. wenn du mehrere Werte gemeinsam speichern möchtest.


**Vermeidung von Klartext in Skripten**: Secrets sollten nicht im Klartext in Skripten oder Umgebungsvariablen gespeichert werden, und die Verwendung von Heredoc und der direkten Speicherung im Key Vault sorgt für Sicherheit in diesem Prozess.

### Fazit
Mit einem einfachen Bash-Einzeiler und dem richtigen Einsatz von Heredoc und OpenSSL kannst du sicherstellen, dass deine mehrzeiligen Secrets sicher in Azure Key Vault abgelegt werden. So bleibt die Cloud-Infrastruktur sicher und übersichtlich, ohne dass sensitive Informationen in den Skripten selbst gespeichert werden müssen.