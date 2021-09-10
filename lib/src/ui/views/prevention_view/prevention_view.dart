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
import 'package:corona_spectator/src/providers/prevention_data_provider.dart';
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
              _preventionCard(
                context,
                items[index].title,
                items[index].content,
                items[index].iconPath,
              ),
              if (index == items.length - 1) Divider(),
            ],
          );
        },
      ),
    );
  }

  Widget _preventionCard(
      BuildContext context, String title, String content, String iconPath) {
    return Column(
      children: [
        Divider(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
          child: Row(
            children: [
              Stack(alignment: Alignment.center, children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    iconPath,
                    color: CantonColors.white,
                  ),
                ),
              ]),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      content,
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            color:
                                Theme.of(context).colorScheme.secondaryVariant,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
