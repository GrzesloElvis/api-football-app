import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../core/constants.dart';
import '../models/league_model.dart';

class ApiService {
  Future<List<League>> fetchLeagues() async {
    final response = await http.get(
      Uri.parse('${Constants.baseUrl}/leagues'),
      headers: {
        'X-RapidAPI-Key': Constants.apiKey,
        'X-RapidAPI-Host': 'v3.football.api-sports.io',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List leaguesJson = data['response'];
      return leaguesJson.map((e) => League.fromJson(e)).toList();
    } else {
      throw Exception('Błąd pobierania lig');
    }
  }
  Future<Map<String, dynamic>> fetchLeagueDetails(int leagueId) async {
    final response = await http.get(
      Uri.parse('${Constants.baseUrl}/teams?league=$leagueId&season=2023'),
      headers: {
        'X-RapidAPI-Key': Constants.apiKey,
        'X-RapidAPI-Host': 'v3.football.api-sports.io',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Błąd pobierania szczegółów ligi');
    }
  }

}
