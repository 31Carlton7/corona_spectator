import 'dart:convert';

class WorldData {
  DateTime? lastUpdated;
  int? totalCases;
  int? todaysCases;
  int? totalDeaths;
  int? todaysDeaths;
  int? totalRecovered;
  int? todaysRecovered;
  int? activeCases;
  int? criticalCases;
  int? totalTested;
  int? population;
  int? affectedCountries;

  WorldData({
    this.lastUpdated,
    this.totalCases,
    this.todaysCases,
    this.totalDeaths,
    this.todaysDeaths,
    this.totalRecovered,
    this.todaysRecovered,
    this.activeCases,
    this.criticalCases,
    this.totalTested,
    this.population,
    this.affectedCountries,
  });

  WorldData copyWith({
    DateTime? lastUpdated,
    int? totalCases,
    int? todaysCases,
    int? totalDeaths,
    int? todaysDeaths,
    int? totalRecovered,
    int? todaysRecovered,
    int? activeCases,
    int? criticalCases,
    int? totalTested,
    int? population,
    int? affectedCountries,
  }) {
    return WorldData(
      lastUpdated: lastUpdated ?? this.lastUpdated,
      totalCases: totalCases ?? this.totalCases,
      todaysCases: todaysCases ?? this.todaysCases,
      totalDeaths: totalDeaths ?? this.totalDeaths,
      todaysDeaths: todaysDeaths ?? this.todaysDeaths,
      totalRecovered: totalRecovered ?? this.totalRecovered,
      todaysRecovered: todaysRecovered ?? this.todaysRecovered,
      activeCases: activeCases ?? this.activeCases,
      criticalCases: criticalCases ?? this.criticalCases,
      totalTested: totalTested ?? this.totalTested,
      population: population ?? this.population,
      affectedCountries: affectedCountries ?? this.affectedCountries,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'updated': lastUpdated?.millisecondsSinceEpoch,
      'cases': totalCases,
      'todayCases': todaysCases,
      'deaths': totalDeaths,
      'todayDeaths': todaysDeaths,
      'recovered': totalRecovered,
      'todayRecovered': todaysRecovered,
      'active': activeCases,
      'critical': criticalCases,
      'tests': totalTested,
      'population': population,
      'affectedCountries': affectedCountries,
    };
  }

  factory WorldData.fromMap(Map<String, dynamic> map) {
    return WorldData(
      lastUpdated: DateTime.fromMillisecondsSinceEpoch(map['updated']),
      totalCases: map['cases'],
      todaysCases: map['todayCases'],
      totalDeaths: map['deaths'],
      todaysDeaths: map['todayDeaths'],
      totalRecovered: map['recovered'],
      todaysRecovered: map['todayRecovered'],
      activeCases: map['active'],
      criticalCases: map['critical'],
      totalTested: map['tests'],
      population: map['population'],
      affectedCountries: map['affectedCountries'],
    );
  }

  String toJson() => json.encode(toMap());

  factory WorldData.fromJson(String source) =>
      WorldData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'WorldData(lastUpdated: $lastUpdated, totalCases: $totalCases, todaysCases: $todaysCases, totalDeaths: $totalDeaths, todaysDeaths: $todaysDeaths, totalRecovered: $totalRecovered, todaysRecovered: $todaysRecovered, activeCases: $activeCases, criticalCases: $criticalCases, totalTested: $totalTested, population: $population, affectedCountries: $affectedCountries)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WorldData &&
        other.lastUpdated == lastUpdated &&
        other.totalCases == totalCases &&
        other.todaysCases == todaysCases &&
        other.totalDeaths == totalDeaths &&
        other.todaysDeaths == todaysDeaths &&
        other.totalRecovered == totalRecovered &&
        other.todaysRecovered == todaysRecovered &&
        other.activeCases == activeCases &&
        other.criticalCases == criticalCases &&
        other.totalTested == totalTested &&
        other.population == population &&
        other.affectedCountries == affectedCountries;
  }

  @override
  int get hashCode {
    return lastUpdated.hashCode ^
        totalCases.hashCode ^
        todaysCases.hashCode ^
        totalDeaths.hashCode ^
        todaysDeaths.hashCode ^
        totalRecovered.hashCode ^
        todaysRecovered.hashCode ^
        activeCases.hashCode ^
        criticalCases.hashCode ^
        totalTested.hashCode ^
        population.hashCode ^
        affectedCountries.hashCode;
  }
}
