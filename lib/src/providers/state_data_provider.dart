import 'package:corona_spectator/src/models/state_data.dart';
import 'package:corona_spectator/src/providers/state_repository_provider.dart';
import 'package:corona_spectator/src/providers/statistics_service_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final stateDataProvider = FutureProvider.autoDispose<StateData>((ref) {
  ref.maintainState = true;
  var source = ref.read(stateRepositoryProvider).getState;
  return ref.read(statisticsServiceProvider).getStateData(source);
});
