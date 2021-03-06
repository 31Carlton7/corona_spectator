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

class StateData {
  DateTime? lastUpdated;
  String? name;
  int? totalCases;
  int? todaysCases;
  int? totalDeaths;
  int? todaysDeaths;
  int? totalRecovered;
  int? activeCases;
  int? population;

  StateData({
    this.lastUpdated,
    this.name,
    this.totalCases,
    this.todaysCases,
    this.totalDeaths,
    this.todaysDeaths,
    this.totalRecovered,
    this.activeCases,
    this.population,
  });

  StateData copyWith({
    DateTime? lastUpdated,
    String? name,
    int? totalCases,
    int? todaysCases,
    int? totalDeaths,
    int? todaysDeaths,
    int? totalRecovered,
    int? active,
    int? population,
  }) {
    return StateData(
      lastUpdated: lastUpdated ?? this.lastUpdated,
      name: name ?? this.name,
      totalCases: totalCases ?? this.totalCases,
      todaysCases: todaysCases ?? this.todaysCases,
      totalDeaths: totalDeaths ?? this.totalDeaths,
      todaysDeaths: todaysDeaths ?? this.todaysDeaths,
      totalRecovered: totalRecovered ?? this.totalRecovered,
      activeCases: active ?? this.activeCases,
      population: population ?? this.population,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'updated': lastUpdated?.millisecondsSinceEpoch,
      'state': name,
      'cases': totalCases,
      'todaysCases': todaysCases,
      'totalDeaths': totalDeaths,
      'todaysDeaths': todaysDeaths,
      'totalRecovered': totalRecovered,
      'active': activeCases,
      'population': population,
    };
  }

  factory StateData.fromMap(Map<String, dynamic> map) {
    return StateData(
      lastUpdated: DateTime.fromMillisecondsSinceEpoch(map['updated']),
      name: map['state'],
      totalCases: map['cases'],
      todaysCases: map['todayCases'],
      totalDeaths: map['deaths'],
      todaysDeaths: map['todayDeaths'],
      totalRecovered: map['recovered'],
      activeCases: map['active'],
      population: map['population'],
    );
  }

  String toJson() => json.encode(toMap());

  factory StateData.fromJson(String source) => StateData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'StateData(lastUpdated: $lastUpdated, name: $name, totalCases: $totalCases, todaysCases: $todaysCases, totalDeaths: $totalDeaths, todaysDeaths: $todaysDeaths, totalRecovered: $totalRecovered, active: $activeCases, population: $population)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StateData &&
        other.lastUpdated == lastUpdated &&
        other.name == name &&
        other.totalCases == totalCases &&
        other.todaysCases == todaysCases &&
        other.totalDeaths == totalDeaths &&
        other.todaysDeaths == todaysDeaths &&
        other.totalRecovered == totalRecovered &&
        other.activeCases == activeCases &&
        other.population == population;
  }

  @override
  int get hashCode {
    return lastUpdated.hashCode ^
        name.hashCode ^
        totalCases.hashCode ^
        todaysCases.hashCode ^
        totalDeaths.hashCode ^
        todaysDeaths.hashCode ^
        totalRecovered.hashCode ^
        activeCases.hashCode ^
        population.hashCode;
  }
}
