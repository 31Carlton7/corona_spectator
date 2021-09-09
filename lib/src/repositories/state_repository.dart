import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class StateRepository extends ChangeNotifier {
  String _state = 'New York';

  String get getState => _state;

  Future<void> changeState(String source) async {
    _state = source;
    await _saveData();
    notifyListeners();
  }

  Future<void> _saveData() async {
    var box = Hive.box('corona_spectator');

    await box.put('last_selected_state', _state);
  }

  void loadData() {
    var box = Hive.box('corona_spectator');

    // Delete data
    // box.delete('last_selected_state');

    var lastSelectedState =
        box.get('last_selected_state', defaultValue: 'New York');

    _state = lastSelectedState;
  }
}
