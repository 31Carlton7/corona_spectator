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
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SymptomRepository {
  final List<SymptomData> _data = [
    SymptomData(
      text: 'Fever or chills',
      iconPath: FontAwesomeIcons.thermometerFull,
    ),
    SymptomData(
      text: 'Cough',
      iconPath: FontAwesomeIcons.headSideCough,
    ),
    SymptomData(
      text: 'Difficulty breathing',
      iconPath: FontAwesomeIcons.lungsVirus,
    ),
    SymptomData(
      text: 'Runny nose',
      iconPath: FontAwesomeIcons.boxTissue,
    ),
    SymptomData(text: 'Head aches', iconPath: FontAwesomeIcons.headSideVirus),
  ];

  List<SymptomData> get symptoms => _data;
}
