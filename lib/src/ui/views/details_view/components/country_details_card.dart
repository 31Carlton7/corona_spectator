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
import 'package:figma_squircle/figma_squircle.dart';

class CountryDetailsCard extends StatelessWidget {
  const CountryDetailsCard(this.data, this.worldRanking);

  final CountryData data;
  final String worldRanking;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Column(
        children: [
          _totalCasesCard(context),
          Divider(),
          _recoveredCard(context),
          Divider(),
          _activeCard(context),
          Divider(),
          _deathsCard(context),
        ],
      ),
    );
  }

  Widget _totalCasesCard(BuildContext context) {
    return Card(
      shape: SquircleBorder(
        radius: BorderRadius.vertical(
          top: Radius.circular(37),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 17,
          vertical: 10,
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Stats',
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(height: 7),
                Text(
                  CantonMethods.separateNumberByThreeDigits(source: data.totalCases!),
                  style: Theme.of(context).textTheme.headline1?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
                const SizedBox(height: 5),
                Text(
                  'TOTAL CASES • #$worldRanking In the world',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: Theme.of(context).colorScheme.secondaryVariant,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _recoveredCard(BuildContext context) {
    return Card(
      shape: SmoothRectangleBorder(borderRadius: SmoothBorderRadius.zero),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 17,
          vertical: 7,
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Recovered',
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: Theme.of(context).colorScheme.background,
                      ),
                ),
                const SizedBox(height: 7),
                Text(
                  CantonMethods.separateNumberByThreeDigits(source: data.totalRecovered!),
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _activeCard(BuildContext context) {
    return Card(
      shape: SmoothRectangleBorder(borderRadius: SmoothBorderRadius.zero),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 17,
          vertical: 7,
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Active',
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: Theme.of(context).colorScheme.surface,
                      ),
                ),
                const SizedBox(height: 7),
                Text(
                  CantonMethods.separateNumberByThreeDigits(source: data.activeCases!),
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _deathsCard(BuildContext context) {
    return Card(
      shape: SquircleBorder(
        radius: BorderRadius.vertical(
          bottom: Radius.circular(37),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 17,
          vertical: 7,
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Deaths',
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: Theme.of(context).colorScheme.error,
                      ),
                ),
                const SizedBox(height: 7),
                Text(
                  CantonMethods.separateNumberByThreeDigits(source: data.totalDeaths!),
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
