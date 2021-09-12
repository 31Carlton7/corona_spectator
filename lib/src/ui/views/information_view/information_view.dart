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

import 'package:canton_design_system/canton_design_system.dart';
import 'package:corona_spectator/src/ui/views/information_view/components/cdc_card.dart';
import 'package:corona_spectator/src/ui/views/information_view/components/emergency_card_112.dart';
import 'package:corona_spectator/src/ui/views/information_view/components/emergency_card_119.dart';
import 'package:corona_spectator/src/ui/views/information_view/components/emergency_card_911.dart';
import 'package:corona_spectator/src/ui/views/information_view/components/information_view_header.dart';
import 'package:corona_spectator/src/ui/views/information_view/components/prevention_card.dart';
import 'package:corona_spectator/src/ui/views/information_view/components/symptom_checker_card.dart';
import 'package:corona_spectator/src/ui/views/information_view/components/symptoms_card.dart';
import 'package:corona_spectator/src/ui/views/information_view/components/who_card.dart';

class InformationView extends StatelessWidget {
  const InformationView();

  @override
  Widget build(BuildContext context) {
    return _content(context);
  }

  Widget _content(BuildContext context) {
    return ListView(
      children: [
        InformationViewHeader(),
        _symptomCheckerSection(context),
        _healthTipsSection(context),
        _emergencyContactsSection(context),
        _usefulLinksSection(context),
      ],
    );
  }

  Widget _healthTipsSection(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Health Tips',
            style: Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(height: 7),
          SymptomsCard(),
          Divider(),
          PreventionCard(),
        ],
      ),
    );
  }

  Widget _emergencyContactsSection(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Emergency Contacts',
            style: Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(height: 7),
          EmergencyCard911(),
          Divider(),
          EmergencyCard112(),
          Divider(),
          EmergencyCard119(),
        ],
      ),
    );
  }

  Widget _usefulLinksSection(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Useful Links',
            style: Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(height: 7),
          CDCCard(),
          Divider(),
          WHOCard(),
        ],
      ),
    );
  }

  Widget _symptomCheckerSection(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: SymptomCheckerCard(),
    );
  }
}
