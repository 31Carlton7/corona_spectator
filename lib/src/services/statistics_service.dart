import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

import 'package:corona_spectator/src/config/exceptions.dart';
import 'package:corona_spectator/src/models/country_data.dart';
import 'package:corona_spectator/src/models/state_data.dart';
import 'package:corona_spectator/src/models/world_data.dart';

class StatisticsService {
  StatisticsService(this._dio);

  final Dio _dio;
  final _rootUrl = 'https://disease.sh/v3/covid-19';

  // ignore: unused_field
  final _vaccineRootUrl = 'https://disease.sh/v3/covid-19/vaccine';

  Future<WorldData> getWorldData() async {
    try {
      final response = await _dio.get(_rootUrl + '/all');

      final result = Map<String, dynamic>.from(response.data);

      final data = WorldData.fromMap(result);

      return data;
    } on DioError catch (e) {
      throw Exceptions.fromDioError(e);
    }
  }

  Future<CountryData> getCountryData(String source) async {
    try {
      var response;
      var timelineResponse;
      var timelineData;

      try {
        response = await _dio.get(_rootUrl + '/countries/$source');
        timelineResponse = await _dio.get(_rootUrl + '/historical/$source');
        timelineData = timelineResponse.data;
      } on DioError catch (e) {
        if (e.type == DioErrorType.response) {
          timelineResponse = Map();
          timelineData = Map();
        }
      }

      final result = Map<String, dynamic>.from(response.data);
      final timelineResult = Map<String, dynamic>.from(timelineData);

      var data = CountryData.fromMap(result);

      if (timelineResult.toString() != '{}') {
        data.casesByDate = Map.from(timelineResult['timeline']['cases']!);
        data.deathsByDate = Map.from(timelineResult['timeline']['deaths']!);

        int newCases() {
          var now = DateTime.now();
          var dateOne = data.casesByDate![DateFormat('M/d/yy').format(
            DateTime(now.year, now.month, now.day - 1),
          )];
          var dateTwo = data.casesByDate![DateFormat('M/d/yy').format(
            DateTime(now.year, now.month, now.day - 2),
          )];

          if (dateOne! > dateTwo!) {
            return dateOne - dateTwo;
          }

          return dateTwo - dateOne;
        }

        int newDeaths() {
          var now = DateTime.now();
          var dateOne = data.deathsByDate![DateFormat('M/d/yy').format(
            DateTime(now.year, now.month, now.day - 1),
          )];
          var dateTwo = data.deathsByDate![DateFormat('M/d/yy').format(
            DateTime(now.year, now.month, now.day - 2),
          )];

          if (dateOne! > dateTwo!) {
            return dateOne - dateTwo;
          }

          return dateTwo - dateOne;
        }

        data.todaysCases = newCases();
        data.todaysDeaths = newDeaths();
      } else {
        data.casesByDate = Map();
        data.deathsByDate = Map();
      }

      return data;
    } on DioError catch (e) {
      throw Exceptions.fromDioError(e);
    }
  }

  Future<List<CountryData>> getAllCountryData() async {
    try {
      final response = await _dio.get(_rootUrl + '/countries');

      final results = List<Map<String, dynamic>>.from(response.data);

      final data = results
          .map((country) => CountryData.fromMapWithBaseInfo(country))
          .toList(growable: false);

      return data;
    } on DioError catch (e) {
      throw Exceptions.fromDioError(e);
    }
  }

  Future<StateData> getStateData(String source) async {
    try {
      var response = await _dio.get(_rootUrl + '/states/$source');

      final result = Map<String, dynamic>.from(response.data);

      var data = StateData.fromMap(result);

      return data;
    } on DioError catch (e) {
      throw Exceptions.fromDioError(e);
    }
  }

  Future<List<StateData>> getAllStateData() async {
    try {
      final response = await _dio.get(_rootUrl + '/states');

      final results = List<Map<String, dynamic>>.from(response.data);

      final data = results
          .map((state) => StateData.fromMap(state))
          .toList(growable: false);

      return data;
    } on DioError catch (e) {
      throw Exceptions.fromDioError(e);
    }
  }
}
