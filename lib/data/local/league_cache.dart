import 'package:shared_preferences/shared_preferences.dart';

class LeagueCache {
  static const String cacheKey = 'cached_leagues';

  Future<void> save(String json) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(cacheKey, json);
  }

  Future<String?> load() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(cacheKey);
  }

  Future<bool> hasCache() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(cacheKey);
  }
}
