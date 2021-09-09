import 'package:corona_spectator/src/repositories/state_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final stateRepositoryProvider = ChangeNotifierProvider<StateRepository>((ref) {
  return StateRepository();
});
