#API FOOTBALL_APP

Aplikacja mobilna, wyświetlająca ligi piłkarskie
oraz szczegóły wybranej ligi na podstawie danych z publicznego REST API.
Aplikacja obsługuje tryb offline, wyszukiwanie, sortowanie oraz integrację
z Firebase.

------------------------------------------------------------------------------
#FUNKCJONALNOSCI

1. Lista lig piłkarskich
2. Wyszukiwanie lig po nazwie
3. Sortowanie lig (A–Z, kraj)
4. Widok szczegółów ligi
5. Pobieranie danych z REST API
6. Obsługa błędów i ekranu ładowania
7. Tryb offline (cache danych lokalnie)
8. Firebase Analytics (custom eventy)
9. Firebase Crashlytics (raportowanie błędów)

------------------------------------------------------------------------------


#API

API-Football  
https://www.api-football.com/documentation-v3

Endpointy:
- `/leagues` – (lista lig)
- `/teams?league={id}&season=2023` – (szczegóły ligi (drużyny))

------------------------------------------------------------------------------


#ARCHITEKTURA

Projekt oparty o:
- UI: `screens/`, `widgets/`
- Logika: `ViewModel`
- Dane: `ApiService`, `Cache`, `NetworkInfo`

------------------------------------------------------------------------------
#FIREBASE

- Firebase Analytics – 3 custom eventy:
  - `app_opened`
  - `league_selected`
  - `search_used`
- Firebase Crashlytics
- Firebase App Distribution

------------------------------------------------------------------------------

#URUCOMIENIE


```bash
$Zainstaluj $zależności:
flutter pub get
$Uruchom $aplikację:
flutter run

------------------------------------------------------------------------------

#Wspierane platformy
Android
iOS

