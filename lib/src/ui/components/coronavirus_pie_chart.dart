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
import 'package:charts_flutter/flutter.dart' as charts;

class CoronavirusPieChart extends StatelessWidget {
  const CoronavirusPieChart(this.seriesList);
  final List<charts.Series<dynamic, String>> seriesList;

  @override
  Widget build(BuildContext context) {
    final circleColorSize = 12.0;
    final spacingBetweenLegendItem = 20.0;
    final spacingBetweenColorAndText = 5.0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: circleColorSize,
                  width: circleColorSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.background,
                  ),
                ),
                SizedBox(width: spacingBetweenColorAndText),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      seriesList.first.data[0].key,
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                            height: 1,
                            color: Theme.of(context).colorScheme.secondaryVariant,
                          ),
                    ),
                    Text(
                      CantonMethods.separateNumberByThreeDigits(
                        source: seriesList.first.data[0].value,
                        commas: true,
                      ),
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: spacingBetweenLegendItem),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: circleColorSize,
                  width: circleColorSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.surface,
                  ),
                ),
                SizedBox(width: spacingBetweenColorAndText),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      seriesList.first.data[1].key,
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                            height: 1,
                            color: Theme.of(context).colorScheme.secondaryVariant,
                          ),
                    ),
                    Text(
                      CantonMethods.separateNumberByThreeDigits(
                        source: seriesList.first.data[1].value,
                        commas: true,
                      ),
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: spacingBetweenLegendItem),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: circleColorSize,
                  width: circleColorSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
                SizedBox(width: spacingBetweenColorAndText),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      seriesList.first.data[2].key,
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                            height: 1,
                            color: Theme.of(context).colorScheme.secondaryVariant,
                          ),
                    ),
                    Text(
                      CantonMethods.separateNumberByThreeDigits(
                        source: seriesList.first.data[2].value,
                        commas: true,
                      ),
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          width: 200,
          height: 200,
          child: charts.PieChart<String>(
            seriesList,
            animate: true,
            defaultRenderer: charts.ArcRendererConfig(arcWidth: 25),
          ),
        ),
      ],
    );
  }
}
