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
import 'package:corona_spectator/src/models/state_data.dart';
import 'package:corona_spectator/src/ui/components/state_selector_bottomsheet.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:intl/intl.dart';

class StateCard extends StatelessWidget {
  const StateCard(this.data);

  final StateData data;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 17),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                showStateSelectorBottomSheet(context);
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    child: Text(
                      _stateNameText(data.name!),
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    child: Icon(
                      Iconsax.arrow_down_1,
                      size: 18,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 7),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  CantonMethods.separateNumberByThreeDigits(
                    source: data.totalCases!,
                  ),
                  style: Theme.of(context).textTheme.headline1?.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 45,
                      ),
                ),
                SizedBox(height: 5),
                Text(
                  'TOTAL CASES',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: Theme.of(context).colorScheme.secondaryVariant,
                      ),
                ),
                const SizedBox(height: 10),
              ],
            ),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Card(
                      shape: SmoothRectangleBorder(
                        borderRadius: SmoothBorderRadius.all(
                          SmoothRadius(cornerRadius: 15, cornerSmoothing: 1),
                        ),
                      ),
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Active Cases',
                              style: Theme.of(context).textTheme.headline6?.copyWith(
                                    color: Theme.of(context).colorScheme.secondaryVariant,
                                  ),
                            ),
                            Text(
                              CantonMethods.separateNumberByThreeDigits(source: data.activeCases!),
                              style: Theme.of(context).textTheme.headline5?.copyWith(
                                    color: Theme.of(context).colorScheme.surface,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  VerticalDivider(
                    thickness: 1,
                    width: 10,
                    color: Theme.of(context).dividerColor,
                  ),
                  Expanded(
                    child: Card(
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      shape: SmoothRectangleBorder(
                        borderRadius: SmoothBorderRadius.all(
                          SmoothRadius(cornerRadius: 15, cornerSmoothing: 1),
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Deaths',
                              style: Theme.of(context).textTheme.headline6?.copyWith(
                                    color: Theme.of(context).colorScheme.secondaryVariant,
                                  ),
                            ),
                            Text(
                              CantonMethods.separateNumberByThreeDigits(source: data.totalDeaths!),
                              style: Theme.of(context).textTheme.headline5?.copyWith(
                                    color: Theme.of(context).colorScheme.error,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Updated at ' + DateFormat('M/d/yy').format(data.lastUpdated!).toString(),
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    color: Theme.of(context).colorScheme.secondaryVariant,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  String _stateNameText(String source) {
    if (source.length > 25) {
      return source.substring(0, 23) + '...';
    }
    return source;
  }
}
