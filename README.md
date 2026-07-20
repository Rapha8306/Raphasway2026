# FamilyOS PWA Starter

Eine kompakte, funktionsfähige Flutter-Grundlage für eine Familien- und Organisations-App.

## Enthalten

- Material Design 3
- Light- und Dark-Mode
- Riverpod für State Management
- GoRouter mit adaptiver Navigation
- Dashboard
- Aufgaben mit lokalem Laufzeitzustand
- Kalenderübersicht
- Familienprofile
- KI-Assistent als sichere Demo-Oberfläche
- Responsive Navigation für Smartphone und Tablet/Desktop
- Deutsche Benutzeroberfläche
- Architektur- und Ausbauhinweise

## Start

1. Flutter 3.38 oder neuer installieren.
2. Im Projektordner ausführen:

```bash
flutter pub get
flutter run
```

## Wichtig

Diese ZIP ist ein echtes Starter-Projekt, aber noch kein produktionsreifes Komplettsystem. Cloud-Synchronisation, Authentifizierung, persistente Datenbank, Push-Nachrichten und eine echte KI-API sind bewusst als nächste Ausbaustufen dokumentiert.

Weitere Hinweise stehen in `CLAUDE.md` und im Ordner `docs`.


## PWA-Version

Die Web-App kann auf iPhone, iPad, Android, Windows und macOS installiert werden.
Details zu Build, Installation, Hosting und Offline-Verhalten stehen in `docs/PWA.md`.


## Für dein GitHub-Repository vorbereitet

Dieses Paket ist direkt auf `Rapha8306/Raphas_Way` und die GitHub-Pages-Adresse
`https://rapha8306.github.io/Raphas_Way/` abgestimmt.

Der Workflow unter `.github/workflows/deploy-pages.yml` baut und veröffentlicht
die App bei jedem Push auf `main`. Die genaue Anleitung steht in
`docs/GITHUB_PAGES.md`.
