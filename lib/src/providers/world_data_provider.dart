import 'package:corona_spectator/src/models/world_data.dart';
import 'package:corona_spectator/src/providers/statistics_service_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final worldDataProvider = FutureProvider.autoDispose<WorldData>((ref) {
  ref.maintainState = true;
  return ref.read(statisticsServiceProvider).getWorldData();
});
