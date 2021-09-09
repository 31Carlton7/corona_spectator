import 'package:corona_spectator/src/models/state_data.dart';
import 'package:corona_spectator/src/providers/statistics_service_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final allStateDataProvider = FutureProvider.autoDispose<List<StateData>>((ref) {
  ref.maintainState = true;
  return ref.read(statisticsServiceProvider).getAllStateData();
});
