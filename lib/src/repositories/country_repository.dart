/*
Corona Spectator
Copyright (C) 2021  Carlton Aikins

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
*/

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

    var lastSelectedCountry = box.get('last_selected_country', defaultValue: 'USA');

    _country = lastSelectedCountry;
  }
}
