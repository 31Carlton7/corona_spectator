import 'package:corona_spectator/src/models/country_data.dart';
import 'package:corona_spectator/src/providers/country_repository_provider.dart';
import 'package:corona_spectator/src/providers/statistics_service_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final countryDataProvider = FutureProvider.autoDispose<CountryData>((ref) {
  ref.maintainState = true;
  var source = ref.read(countryRepositoryProvider).getCountry;
  return ref.read(statisticsServiceProvider).getCountryData(source);
});
