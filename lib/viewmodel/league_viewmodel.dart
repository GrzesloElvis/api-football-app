import 'dart:convert';

import 'package:flutter/material.dart';

import '../data/models/league_model.dart';
import '../data/services/api_service.dart';
import '../data/local/league_cache.dart';
import '../core/network_info.dart';

class LeagueViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  final LeagueCache _cache = LeagueCache();
  final NetworkInfo _networkInfo = NetworkInfo();

  List<League> _leagues = [];
  List<League> filteredLeagues = [];

  bool isLoading = false;
  String? errorMessage;
  bool isOffline = false;

  Future<void> loadLeagues() async {
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

      final connected = await _networkInfo.isConnected;

      if (connected) {
        isOffline = false;

        _leagues = await _apiService.fetchLeagues();
        filteredLeagues = List.from(_leagues);

        await _cache.save(
          jsonEncode(
            _leagues.map((e) => e.toCacheJson()).toList(),
          ),
        );
      } else {

        isOffline = true;

        final cached = await _cache.load();
        if (cached == null) {
          throw Exception('Brak połączenia z internetem i brak danych offline');
        }

        final List data = jsonDecode(cached);
        _leagues = data.map((e) => League.fromCacheJson(e)).toList();
        filteredLeagues = List.from(_leagues);
      }
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }


  void search(String query) {
    filteredLeagues = _leagues
        .where(
          (l) => l.name.toLowerCase().contains(query.toLowerCase()),
    )
        .toList();
    notifyListeners();
  }


  void sortByName() {
    filteredLeagues.sort((a, b) => a.name.compareTo(b.name));
    notifyListeners();
  }


  void sortByCountry() {
    filteredLeagues.sort((a, b) => a.country.compareTo(b.country));
    notifyListeners();
  }
}
