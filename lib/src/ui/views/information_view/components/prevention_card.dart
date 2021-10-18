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
import 'package:corona_spectator/src/ui/views/prevention_view/prevention_view.dart';

class PreventionCard extends StatelessWidget {
  const PreventionCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        CantonMethods.viewTransition(context, PreventionView());
      },
      child: Card(
        shape: SquircleBorder(
          radius: BorderRadius.vertical(
            bottom: Radius.circular(37),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.only(
            left: 12,
            right: 12,
            bottom: 12,
            top: 7.5,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Prevention & Advice',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Spacer(),
                  CantonActionButton(
                    padding: EdgeInsets.zero,
                    alignment: MainAxisAlignment.end,
                    icon: Icon(
                      Iconsax.arrow_right_2,
                      size: 20,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      CantonMethods.viewTransition(context, PreventionView());
                    },
                  ),
                ],
              ),
              Text(
                'Advice on how to protect yourself and prevent the spread.',
                style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: Theme.of(context).colorScheme.secondaryVariant,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
