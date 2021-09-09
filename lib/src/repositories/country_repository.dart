import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class CountryRepository extends ChangeNotifier {
  String _country = 'USA';

  String get getCountry => _country;

  Future<void> changeCountry(String source) async {
    _country = source;
    await _saveData();
    notifyListeners();
  }

  Future<void> _saveData() async {
    var box = Hive.box('corona_spectator');

    await box.put('last_selected_country', _country);
  }

  void loadData() {
    var box = Hive.box('corona_spectator');

    // Delete data
    // box.delete('last_selected_country');

    var lastSelectedCountry =
        box.get('last_selected_country', defaultValue: 'USA');

    _country = lastSelectedCountry;
  }
}
