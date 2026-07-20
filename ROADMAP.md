name: Deploy FamilyOS PWA to GitHub Pages

on:
  push:
    branches: ["main"]
  workflow_dispatch:

permissions:
  contents: read
  pages: write
  id-token: write

concurrency:
  group: pages
  cancel-in-progress: true

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Repository auschecken
        uses: actions/checkout@v4

      - name: Flutter installieren
        uses: subosito/flutter-action@v2
        with:
          channel: stable
          cache: true

      - name: Abhängigkeiten installieren
        run: flutter pub get

      - name: Code analysieren
        run: flutter analyze

      - name: Tests ausführen
        run: flutter test

      - name: Web-App für GitHub Pages bauen
        run: flutter build web --release --base-href "/Raphas_Way/"

      - name: GitHub-Pages-Routing vorbereiten
        shell: bash
        run: |
          cp build/web/index.html build/web/404.html
          touch build/web/.nojekyll

      - name: Pages konfigurieren
        uses: actions/configure-pages@v5

      - name: Build-Artefakt hochladen
        uses: actions/upload-pages-artifact@v3
        with:
          path: build/web

  deploy:
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    needs: build

    steps:
      - name: Auf GitHub Pages veröffentlichen
        id: deployment
        uses: actions/deploy-pages@v4
