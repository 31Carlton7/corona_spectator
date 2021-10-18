/*
Corona Spectator
Copyright (C) 2021  Carlton Aikins

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
*/

import 'dart:convert';

class CountryData {
  DateTime? lastUpdated;
  String? name;
  String? flagUrl;
  String? continent;
  Map<String, int>? casesByDate;
  int? totalCases;
  int? todaysCases;
  Map<String, int>? deathsByDate;
  int? totalDeaths;
  int? todaysDeaths;
  int? totalRecovered;
  int? todaysRecovered;
  int? activeCases;
  int? criticalCases;
  int? totalTested;
  int? population;

  CountryData({
    this.lastUpdated,
    this.name,
    this.flagUrl,
    this.continent,
    this.casesByDate,
    this.totalCases,
    this.todaysCases,
    this.deathsByDate,
    this.totalDeaths,
    this.todaysDeaths,
    this.totalRecovered,
    this.todaysRecovered,
    this.activeCases,
    this.criticalCases,
    this.totalTested,
    this.population,
  });

  CountryData copyWith({
    DateTime? lastUpdated,
    String? country,
    String? countryFlagImageUrl,
    String? continent,
    Map<String, int>? casesByDate,
    int? totalCases,
    int? todaysCases,
    Map<String, int>? deathsByDate,
    int? totalDeaths,
    int? todaysDeaths,
    int? totalRecovered,
    int? todaysRecovered,
    int? activeCases,
    int? criticalCases,
    int? totalTested,
    int? population,
  }) {
    return CountryData(
      lastUpdated: lastUpdated ?? this.lastUpdated,
      name: country ?? this.name,
      flagUrl: countryFlagImageUrl ?? this.flagUrl,
      continent: continent ?? this.continent,
      casesByDate: casesByDate ?? this.casesByDate,
      totalCases: totalCases ?? this.totalCases,
      todaysCases: todaysCases ?? this.todaysCases,
      deathsByDate: deathsByDate ?? this.deathsByDate,
      totalDeaths: totalDeaths ?? this.totalDeaths,
      todaysDeaths: todaysDeaths ?? this.todaysDeaths,
      totalRecovered: totalRecovered ?? this.totalRecovered,
      todaysRecovered: todaysRecovered ?? this.todaysRecovered,
      activeCases: activeCases ?? this.activeCases,
      criticalCases: criticalCases ?? this.criticalCases,
      totalTested: totalTested ?? this.totalTested,
      population: population ?? this.population,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'updated': lastUpdated?.millisecondsSinceEpoch,
      'country': name,
      'countryFlagImageUrl': flagUrl,
      'continent': continent,
      'casesByDate': casesByDate,
      'cases': totalCases,
      'todayCases': todaysCases,
      'deathsByDate': deathsByDate,
      'deaths': totalDeaths,
      'todayDeaths': todaysDeaths,
      'recovered': totalRecovered,
      'todayRecovered': todaysRecovered,
      'active': activeCases,
      'critical': criticalCases,
      'tests': totalTested,
      'population': population,
    };
  }

  factory CountryData.fromMap(Map<String, dynamic> map) {
    return CountryData(
      lastUpdated: DateTime.fromMillisecondsSinceEpoch(map['updated']),
      name: map['country'],
      flagUrl: map['countryInfo']['flag'],
      continent: map['continent'],
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
    );
  }

  factory CountryData.fromMapWithBaseInfo(Map<String, dynamic> map) {
    return CountryData(
      name: map['country'],
      flagUrl: map['countryInfo']['countryFlagImageUrl'],
      continent: map['continent'],
      totalCases: map['cases'],
      todaysCases: map['todayCases'],
      totalDeaths: map['deaths'],
      todaysDeaths: map['todayDeaths'],
      activeCases: map['active'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CountryData.fromJson(String source) => CountryData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CountryData(lastUpdated: $lastUpdated, name: $name, countryFlagImageUrl: $flagUrl, continent: $continent, casesByDate: $casesByDate, totalCases: $totalCases, todaysCases: $todaysCases, deathsByDate: $deathsByDate, totalDeaths: $totalDeaths, todaysDeaths: $todaysDeaths, totalRecovered: $totalRecovered, todaysRecovered: $todaysRecovered, activeCases: $activeCases, criticalCases: $criticalCases, totalTested: $totalTested, population: $population)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CountryData &&
        other.lastUpdated == lastUpdated &&
        other.name == name &&
        other.flagUrl == flagUrl &&
        other.continent == continent &&
        other.casesByDate == casesByDate &&
        other.totalCases == totalCases &&
        other.todaysCases == todaysCases &&
        other.deathsByDate == deathsByDate &&
        other.totalDeaths == totalDeaths &&
        other.todaysDeaths == todaysDeaths &&
        other.totalRecovered == totalRecovered &&
        other.todaysRecovered == todaysRecovered &&
        other.activeCases == activeCases &&
        other.criticalCases == criticalCases &&
        other.totalTested == totalTested &&
        other.population == population;
  }

  @override
  int get hashCode {
    return lastUpdated.hashCode ^
        name.hashCode ^
        flagUrl.hashCode ^
        continent.hashCode ^
        casesByDate.hashCode ^
        totalCases.hashCode ^
        todaysCases.hashCode ^
        deathsByDate.hashCode ^
        totalDeaths.hashCode ^
        todaysDeaths.hashCode ^
        totalRecovered.hashCode ^
        todaysRecovered.hashCode ^
        activeCases.hashCode ^
        criticalCases.hashCode ^
        totalTested.hashCode ^
        population.hashCode;
  }
}
