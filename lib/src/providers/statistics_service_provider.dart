import 'package:corona_spectator/src/services/statistics_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final statisticsServiceProvider = Provider<StatisticsService>((ref) {
  return StatisticsService(Dio());
});
