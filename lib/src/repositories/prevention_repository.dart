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
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PreventionRepository {
  final List<PreventionData> _data = [
    PreventionData(
      title: 'Stay Home',
      content: 'Try to stay home and quarantine as much as possible to minimize risk of contracting the virus.',
      iconPath: FontAwesomeIcons.home,
    ),
    PreventionData(
      title: 'Get Vaccinated',
      content:
          'Getting a vaccine significantly decreases the chances of contracting COVID-19 and helps to fight the virus.',
      iconPath: FontAwesomeIcons.syringe,
    ),
    PreventionData(
      title: 'Wash your hands frequently',
      content:
          'Washing your hands removes many germs. Make sure to clean your devices and other things you use consistently as well.',
      iconPath: FontAwesomeIcons.handsWash,
    ),
    PreventionData(
      title: 'Wear your mask',
      content: 'Make sure you wear your mask if you go out and are near people, and don\'t let it slip past your nose.',
      iconPath: FontAwesomeIcons.headSideMask,
    ),
    PreventionData(
      title: 'Maintain Social Distancing',
      content: 'Stay at least 2 meters or 6 feet away from people who show symptoms of the virus.',
      iconPath: FontAwesomeIcons.peopleArrows,
    ),
    PreventionData(
      title: 'Limit in person interactions',
      content: 'Do not converse with large groups of people.',
      iconPath: FontAwesomeIcons.usersSlash,
    ),
    PreventionData(
      title: 'Stay Calm',
      content: 'Do not worry or panic, and make sure to eat and get enough sleep everyday.',
      iconPath: FontAwesomeIcons.pray,
    ),
  ];

  List<PreventionData> get tips => _data;
}
