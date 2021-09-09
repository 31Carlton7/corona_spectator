import 'package:corona_spectator/src/models/country_data.dart';
import 'package:corona_spectator/src/providers/statistics_service_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final allCountryDataProvider =
    FutureProvider.autoDispose<List<CountryData>>((ref) {
  ref.maintainState = true;
  return ref.read(statisticsServiceProvider).getAllCountryData();
});
