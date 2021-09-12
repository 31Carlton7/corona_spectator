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
import 'package:corona_spectator/src/models/country_data.dart';
import 'package:intl/intl.dart';

class CountryNewCasesCard extends StatelessWidget {
  const CountryNewCasesCard(this.data);

  final CountryData data;

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
            Row(
              children: [
                Text.rich(
                  TextSpan(
                    text: 'Today • ',
                    children: [
                      TextSpan(
                        text: DateFormat('MMMd').format(DateTime.now()),
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                              color: Theme.of(context).colorScheme.secondaryVariant,
                            ),
                      ),
                    ],
                  ),
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: Theme.of(context).colorScheme.primaryVariant,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: '+${CantonMethods.separateNumberByThreeDigits(source: data.todaysCases!)} ',
                children: [
                  TextSpan(
                    text: 'New cases',
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: Theme.of(context).colorScheme.secondaryVariant,
                        ),
                  ),
                ],
              ),
              style: Theme.of(context).textTheme.headline1?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).primaryColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
