import 'package:flutter/material.dart';
import '../data/services/api_service.dart';

class LeagueDetailsViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  bool isLoading = false;
  String? error;
  int teamsCount = 0;

  Future<void> loadDetails(int leagueId) async {
    try {
      isLoading = true;
      error = null;
      notifyListeners();

      final data = await _apiService.fetchLeagueDetails(leagueId);
      teamsCount = data['response'].length;
    } catch (e) {
      error = 'Nie udało się pobrać szczegółów ligi';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
