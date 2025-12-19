class League {
  final int id;
  final String name;
  final String type;
  final String country;
  final String logo;
  final int season;

  League({
    required this.id,
    required this.name,
    required this.type,
    required this.country,
    required this.logo,
    required this.season,
  });

  factory League.fromJson(Map<String, dynamic> json) {
    return League(
      id: json['league']['id'],
      name: json['league']['name'],
      type: json['league']['type'],
      country: json['country']['name'],
      logo: json['league']['logo'],
      season: json['seasons'][0]['year'],
    );
  }
  Map<String, dynamic> toCacheJson() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'country': country,
      'logo': logo,
      'season': season,
    };
  }

  factory League.fromCacheJson(Map<String, dynamic> json) {
    return League(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      country: json['country'],
      logo: json['logo'],
      season: json['season'],
    );
  }

}
