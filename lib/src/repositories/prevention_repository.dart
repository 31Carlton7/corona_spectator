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

import 'package:corona_spectator/src/models/prevention_data.dart';

class PreventionRepository {
  final List<PreventionData> _data = [
    PreventionData(
      title: 'Stay Home',
      content:
          'Try to stay home and quarantine as much as possible to minimize risk of contracting the virus.',
      iconPath: 'assets/icons/home.svg',
    ),
    PreventionData(
      title: 'Get Vaccinated',
      content:
          'Getting a vaccine significantly decreases the chances of contracting COVID-19 and helps to fight the virus.',
      iconPath: 'assets/icons/vaccine.svg',
    ),
    PreventionData(
      title: 'Wash your hands frequently',
      content:
          'Washing your hands removes many germs. Make sure to clean your devices and other things you use consistently as well.',
      iconPath: 'assets/icons/washing_hands.svg',
    ),
    PreventionData(
      title: 'Wear your mask',
      content:
          'Make sure you wear your mask if you go out and are near people, and don\'t let it slip past your nose.',
      iconPath: 'assets/icons/person_wearing_mask.svg',
    ),
    PreventionData(
      title: 'Maintain Social Distancing',
      content:
          'Stay at least 2 meters or 6 feet away from people who show symptoms of the virus.',
      iconPath: 'assets/icons/social_distancing.svg',
    ),
    PreventionData(
      title: 'Limit in person interactions',
      content: 'Do not converse with large groups of people.',
      iconPath: 'assets/icons/interactions.svg',
    ),
    PreventionData(
      title: 'Stay Calm',
      content:
          'Do not worry or panic, and make sure to eat and get enough sleep everyday.',
      iconPath: 'assets/icons/calm.svg',
    ),
  ];

  List<PreventionData> get tips => _data;
}
