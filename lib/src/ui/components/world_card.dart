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
import 'package:corona_spectator/src/models/world_data.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:corona_spectator/src/ui/components/coronavirus_pie_chart.dart';
import 'package:intl/intl.dart';

class WorldCard extends StatelessWidget {
  const WorldCard(this.data);

  final WorldData data;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(left: 17, right: 17, bottom: 17),
      child: Container(
        padding: const EdgeInsets.only(left: 17, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: Text(
                'World',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: CantonMethods.separateNumberByThreeDigits(
                          source: data.totalCases!,
                        ),
                        style: Theme.of(context).textTheme.headline1?.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      TextSpan(
                        text: (data.todaysCases != 0)
                            ? ' +' + CantonMethods.separateNumberByThreeDigits(source: data.todaysCases!)
                            : '',
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                              color: Theme.of(context).primaryColor,
                            ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'TOTAL CASES',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: Theme.of(context).colorScheme.secondaryVariant,
                      ),
                ),
              ],
            ),
            CoronavirusPieChart(_chartData(context, data)),
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

  static List<charts.Series<dynamic, String>> _chartData(
    BuildContext context,
    WorldData worldData,
  ) {
    var worldMapAndKeys = {
      'Recovered': worldData.totalRecovered,
      'Active': worldData.activeCases,
      'Deaths': worldData.totalDeaths,
    };

    var data = worldMapAndKeys.entries.toList();

    charts.Color chartColor(Color color) {
      return charts.Color(
        r: color.red,
        g: color.green,
        b: color.blue,
      );
    }

    return [
      charts.Series<dynamic, String>(
        id: 'Segments',
        colorFn: (_, number) {
          switch (number) {
            case 0:
              return chartColor(Theme.of(context).colorScheme.background);
            case 1:
              return chartColor(Theme.of(context).colorScheme.surface);
            case 2:
              return chartColor(Theme.of(context).colorScheme.error);
            default:
              return chartColor(CantonColors.white);
          }
        },
        domainFn: (segment, _) => segment.key,
        measureFn: (segment, _) => segment.value,
        data: data,
      ),
    ];
  }
}
