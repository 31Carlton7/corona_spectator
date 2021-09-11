/*
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

import 'package:corona_spectator/src/models/symptom_data.dart';

class SymptomRepository {
  final List<SymptomData> _data = [
    SymptomData(
      text: 'Fever or chills',
      iconPath: 'assets/icons/body_ache.svg',
    ),
    SymptomData(
      text: 'Cough',
      iconPath: 'assets/icons/cough.svg',
    ),
    SymptomData(
      text: 'Difficulty breathing',
      iconPath: 'assets/icons/breathing.svg',
    ),
    SymptomData(
      text: 'Runny nose',
      iconPath: 'assets/icons/runny_nose.svg',
    ),
    SymptomData(
      text: 'Body aches',
      iconPath: 'assets/icons/body_ache.svg',
    ),
  ];

  List<SymptomData> get symptoms => _data;
}
