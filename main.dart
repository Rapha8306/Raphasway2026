# Architektur

Die App verwendet eine schlanke Feature-Struktur:

- `core`: Routing, Theme und allgemeine Infrastruktur
- `features`: Fachmodule
- `shared`: wiederverwendbare Widgets

Die aktuelle Version hält Daten nur während der Laufzeit. Für den nächsten Schritt soll ein Repository-Layer eingeführt werden:

UI → Controller/Provider → Repository → lokale Datenquelle / Remote-Datenquelle

Cloud-Anbieter und Datenbank sollen erst festgelegt werden, wenn Datenschutz, Hostingregion, Kosten und Offline-Synchronisation geklärt sind.
