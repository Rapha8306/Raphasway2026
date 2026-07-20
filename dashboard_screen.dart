# FamilyOS als Progressive Web App

## Entwicklung starten

```bash
flutter pub get
flutter run -d chrome
```

## Produktionsversion bauen

```bash
flutter build web --release
```

Das Ergebnis liegt danach in `build/web`.

## Lokal testen

Service Worker funktionieren zuverlässig nur über HTTP(S), nicht beim direkten Öffnen einer Datei.

```bash
cd build/web
python -m http.server 8080
```

Danach `http://localhost:8080` öffnen.

## Installation

### iPhone und iPad
1. FamilyOS in Safari öffnen.
2. Teilen antippen.
3. „Zum Home-Bildschirm“ wählen.

### Android
1. FamilyOS in Chrome öffnen.
2. Browsermenü öffnen.
3. „App installieren“ oder „Zum Startbildschirm hinzufügen“ wählen.

### Desktop
In Chrome oder Edge erscheint in der Adressleiste eine Installationsmöglichkeit.

## Enthalten

- Web-App-Manifest
- App-Icons in 192 und 512 Pixel
- Maskable Icons
- Standalone-Darstellung
- Startbildschirm
- Offline-Fallback
- Runtime-Caching
- Installations-Shortcuts
- Netlify- und Vercel-Konfiguration

## Wichtige Produktionshinweise

- Die App muss über HTTPS ausgeliefert werden.
- Nach Service-Worker-Änderungen muss `CACHE_VERSION` erhöht werden.
- Personenbezogene Daten dürfen nicht unverschlüsselt im Browser-Cache landen.
- Für echte Offline-Fachdaten ist zusätzlich eine lokale Datenbank wie Drift/SQLite-Wasm oder IndexedDB erforderlich.
- Eine echte KI-Anbindung benötigt ein abgesichertes Backend; API-Schlüssel gehören nie in die PWA.
