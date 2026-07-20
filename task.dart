# Veröffentlichung auf GitHub Pages

Dieses Projekt ist für folgendes Repository vorbereitet:

- GitHub-Benutzer: `Rapha8306`
- Repository: `Raphas_Way`
- erwartete App-Adresse: `https://rapha8306.github.io/Raphas_Way/`

## Variante A – ZIP über die GitHub-Webseite hochladen

1. Öffne dein Repository `Rapha8306/Raphas_Way`.
2. Wechsle zum Tab **Code**.
3. Wähle **Add file → Upload files**.
4. Entpacke diese ZIP auf deinem Computer.
5. Lade den **Inhalt des Ordners `FamilyOS_Starter`** hoch, nicht den übergeordneten Ordner.
6. Speichere die Dateien mit **Commit changes**.

Wichtig: Versteckte Ordner wie `.github` müssen ebenfalls hochgeladen werden. Unter Windows kann es einfacher sein, GitHub Desktop oder Git zu verwenden.

## Variante B – Mit Git

```bash
git clone https://github.com/Rapha8306/Raphas_Way.git
cd Raphas_Way
```

Danach den Inhalt dieses Projekts in den Repository-Ordner kopieren:

```bash
git add .
git commit -m "FamilyOS PWA mit GitHub Pages Deployment"
git push origin main
```

## GitHub Pages einmalig aktivieren

1. Repository öffnen.
2. **Settings → Pages** aufrufen.
3. Unter **Build and deployment** bei **Source** die Option **GitHub Actions** wählen.
4. Zum Tab **Actions** wechseln.
5. Den Workflow **Deploy FamilyOS PWA to GitHub Pages** öffnen.
6. Falls nötig **Run workflow** anklicken.

Bei jedem späteren Push auf `main` wird die PWA automatisch neu gebaut und veröffentlicht.

## Warum der Repository-Pfad wichtig ist

Die App wird nicht an der Domainwurzel, sondern unter `/Raphas_Way/` ausgeliefert. Der Workflow baut Flutter deshalb mit:

```bash
flutter build web --release --base-href "/Raphas_Way/"
```

Auch `start_url` und `scope` im Manifest zeigen auf `/Raphas_Way/`.

## Nach erfolgreichem Deployment

Die App sollte unter folgender Adresse erreichbar sein:

```text
https://rapha8306.github.io/Raphas_Way/
```

### Installation auf dem iPhone

1. Adresse in Safari öffnen.
2. Teilen-Symbol antippen.
3. **Zum Home-Bildschirm** auswählen.
4. Mit **Hinzufügen** bestätigen.

### Installation auf Android

1. Adresse in Chrome öffnen.
2. Menü öffnen.
3. **App installieren** oder **Zum Startbildschirm hinzufügen** auswählen.

## Fehlerbehebung

### Die Aktion schlägt beim Test fehl

Öffne den fehlgeschlagenen Schritt im Tab **Actions**. Häufige Ursachen sind nicht passende Flutter-Paketversionen oder Analysefehler.

### Die Seite zeigt nur einen weissen Bildschirm

Prüfe, ob der Build wirklich mit `--base-href "/Raphas_Way/"` ausgeführt wurde.

### Alte Version bleibt sichtbar

Die PWA verwendet einen Service Worker. Browserdaten der Seite löschen oder die App einmal deinstallieren und neu installieren. Bei Änderungen am eigenen Service Worker zusätzlich die Cache-Version erhöhen.

### GitHub Pages zeigt 404

Unter **Settings → Pages** muss als Quelle **GitHub Actions** ausgewählt sein. Prüfe ausserdem, ob der Deployment-Workflow erfolgreich abgeschlossen wurde.
