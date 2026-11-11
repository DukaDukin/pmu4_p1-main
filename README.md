# Objave – Flutter aplikacija

Mobilna aplikacija dohvaća objave s javnog API-ja **JSONPlaceholder**:
https://jsonplaceholder.typicode.com/posts

Na početnom ekranu prikazuje popis objava. Odabirom objave otvara se zaseban ekran s naslovom, sadržajem i ID-em autora.

## Struktura

- `lib/main.dart` – pokretanje aplikacije i tema
- `lib/modeli/objava.dart` – model i pretvorba JSON zapisa u objekt
- `lib/usluge/objava_usluga.dart` – asinkroni HTTP dohvat podataka
- `lib/ekrani/popis_ekran.dart` – popis, `FutureBuilder`, `ListView.builder`, osvježavanje i navigacija
- `lib/ekrani/detalji_ekran.dart` – detalji odabrane objave
- `lib/widgeti/objava_kartica.dart` – kartica objave, animacija i dugi pritisak

## Animacije i geste

- **Hero animacija** – broj objave prelazi s kartice na ekran detalja (`objava_kartica.dart` i `detalji_ekran.dart`).
- **AnimatedContainer** – kartica mijenja boju i obrub kada je označena (`objava_kartica.dart`).
- **Dugi pritisak** – označava ili odznačava objavu i prikazuje poruku (`objava_kartica.dart`).
- **Povlačenje prema dolje** – `RefreshIndicator` ponovno dohvaća podatke (`popis_ekran.dart`).

## Pokretanje

1. Instaliraj Flutter SDK i Android Studio ili drugi podržani editor.
2. Otvori mapu projekta u Visual Studio Codeu ili Android Studiju.
3. U terminalu, unutar mape projekta, pokreni:

   ```bash
   flutter pub get
   flutter run
   ```

4. Za provjeru koda pokreni:

   ```bash
   flutter analyze
   ```

Aplikacija treba internetsku vezu. API ne traži prijavu.

## GitHub predaja

Prije predaje pokreni aplikaciju na emulatoru ili mobitelu i dodaj 2–3 stvarne snimke zaslona u repozitorij (npr. u mapu `screenshots/`). Zatim objavi projekt u javnom GitHub repozitoriju.
