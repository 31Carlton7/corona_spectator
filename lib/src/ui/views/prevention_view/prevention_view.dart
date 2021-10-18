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
import 'package:corona_spectator/src/providers/prevention_data_provider.dart';
import 'package:corona_spectator/src/ui/views/prevention_view/components/prevention_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:corona_spectator/src/ui/views/prevention_view/components/prevention_view_header.dart';

class PreventionView extends StatelessWidget {
  const PreventionView();

  @override
  Widget build(BuildContext context) {
    Color _canvasColor() {
      if (MediaQuery.of(context).platformBrightness == Brightness.dark) {
        return Theme.of(context).canvasColor;
      }
      return Theme.of(context).backgroundColor;
    }

    return CantonScaffold(
      padding: EdgeInsets.zero,
      backgroundColor: _canvasColor(),
      body: _content(context),
    );
  }

  Widget _content(BuildContext context) {
    return Column(
      children: [
        PreventionViewHeader(),
        _body(context),
      ],
    );
  }

  Widget _body(BuildContext context) {
    var items = context.read(preventionDataProvider);

    return Expanded(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              PreventionCard(
                title: items[index].title,
                content: items[index].content,
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
