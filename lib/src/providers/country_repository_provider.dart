import 'package:corona_spectator/src/repositories/country_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final countryRepositoryProvider =
    ChangeNotifierProvider<CountryRepository>((ref) {
  return CountryRepository();
});
