import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  static final FirebaseAnalytics _analytics =
      FirebaseAnalytics.instance;

  static Future<void> appOpened() async {
    await _analytics.logEvent(name: 'app_opened');
  }

  static Future<void> leagueSelected(String leagueName) async {
    await _analytics.logEvent(
      name: 'league_selected',
      parameters: {'league_name': leagueName},
    );
  }

  static Future<void> searchUsed(String query) async {
    await _analytics.logEvent(
      name: 'search_used',
      parameters: {'query': query},
    );
  }
}
