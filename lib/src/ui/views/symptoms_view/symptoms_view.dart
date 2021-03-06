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

import 'package:canton_design_system/canton_design_system.dart';
import 'package:corona_spectator/src/ui/views/symptoms_view/components/symptom_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:corona_spectator/src/providers/symptom_data_provider.dart';
import 'package:corona_spectator/src/ui/views/symptoms_view/components/symptoms_view_header.dart';

class SymptomsView extends StatelessWidget {
  const SymptomsView();

  @override
  Widget build(BuildContext context) {
    return CantonScaffold(
      padding: EdgeInsets.zero,
      backgroundColor: CantonMethods.alternateCanvasColor(context),
      body: _content(context),
    );
  }

  Widget _content(BuildContext context) {
    return Column(
      children: [
        SymptomsViewHeader(),
        _body(context),
      ],
    );
  }

  Widget _body(BuildContext context) {
    var items = context.read(symptomDataProvider);
    return Expanded(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              SymptomCard(
                text: items[index].text,
                iconPath: items[index].iconPath,
              ),
              if (index == items.length - 1) Divider(),
            ],
          );
        },
      ),
    );
  }
}
