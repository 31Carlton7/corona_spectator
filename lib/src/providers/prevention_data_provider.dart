import 'package:corona_spectator/src/models/prevention_data.dart';
import 'package:corona_spectator/src/providers/prevention_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final preventionDataProvider = Provider<List<PreventionData>>((ref) {
  return ref.read(preventionRepositoryProvider).tips;
});
