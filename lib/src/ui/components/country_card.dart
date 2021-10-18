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
import 'package:corona_spectator/src/models/country_data.dart';
import 'package:corona_spectator/src/ui/components/country_name_text.dart';
import 'package:corona_spectator/src/ui/components/country_selector_bottomsheet.dart';
import 'package:corona_spectator/src/ui/views/details_view/details_view.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:intl/intl.dart';

class CountryCard extends StatelessWidget {
  const CountryCard(this.data);

  final CountryData data;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        CantonMethods.viewTransition(context, DetailsView());
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 17),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      showCountrySelectorBottomSheet(context);
                    },
                    child: Container(
                      color: CantonColors.transparent,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(
                                  data.flagUrl!,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            child: Text(
                              countryNameText(data.name!),
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
                  ),
                  Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          CantonMethods.viewTransition(context, DetailsView());
                        },
                        child: Text(
                          'Details',
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).primaryColor,
                              ),
                        ),
                      ),
                      CantonActionButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(
                          Iconsax.arrow_right_2,
                          size: 20,
                          color: Theme.of(context).primaryColor,
                        ),
                        onPressed: () {
                          CantonMethods.viewTransition(context, DetailsView());
                        },
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 7),
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
                                fontSize: 45,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                        TextSpan(
                          text: (data.todaysCases != 0)
                              ? ' +' +
                                  CantonMethods.separateNumberByThreeDigits(
                                    source: data.todaysCases!,
                                  )
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
                  const SizedBox(height: 10),
                ],
              ),
              data.casesByDate!.isNotEmpty
                  ? IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Card(
                            margin: const EdgeInsets.symmetric(vertical: 15),
                            shape: SmoothRectangleBorder(
                              borderRadius: SmoothBorderRadius.all(
                                SmoothRadius(cornerRadius: 15, cornerSmoothing: 1),
                              ),
                            ),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 40,
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    'Recovered',
                                    style: Theme.of(context).textTheme.headline6?.copyWith(
                                          color: Theme.of(context).colorScheme.secondaryVariant,
                                        ),
                                  ),
                                  Text(
                                    CantonMethods.separateNumberByThreeDigits(source: data.totalRecovered!),
                                    style: Theme.of(context).textTheme.headline6?.copyWith(
                                          fontSize: 16,
                                          color: Theme.of(context).colorScheme.background,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          VerticalDivider(
                            thickness: 1,
                            width: 10,
                            color: Theme.of(context).dividerColor,
                          ),
                          Card(
                            margin: const EdgeInsets.symmetric(vertical: 15),
                            shape: SmoothRectangleBorder(
                              borderRadius: SmoothBorderRadius.all(
                                SmoothRadius(cornerRadius: 15, cornerSmoothing: 1),
                              ),
                            ),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 30,
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
                                    style: Theme.of(context).textTheme.headline6?.copyWith(
                                          fontSize: 16,
                                          color: Theme.of(context).colorScheme.surface,
                                        ),
                                  ),
                                  Text(
                                    (data.todaysCases != 0)
                                        ? '+' + CantonMethods.separateNumberByThreeDigits(source: data.todaysCases!)
                                        : '',
                                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                          color: Theme.of(context).colorScheme.surface,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          VerticalDivider(
                            thickness: 1,
                            width: 10,
                            color: Theme.of(context).dividerColor,
                          ),
                          Card(
                            margin: const EdgeInsets.symmetric(vertical: 15),
                            shape: SmoothRectangleBorder(
                              borderRadius: SmoothBorderRadius.all(
                                SmoothRadius(cornerRadius: 15, cornerSmoothing: 1),
                              ),
                            ),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 30,
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
                                    style: Theme.of(context).textTheme.headline6?.copyWith(
                                          fontSize: 16,
                                          color: Theme.of(context).colorScheme.error,
                                        ),
                                  ),
                                  Text(
                                    (data.todaysDeaths != 0)
                                        ? '+' + CantonMethods.separateNumberByThreeDigits(source: data.todaysDeaths!)
                                        : '',
                                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                          color: Theme.of(context).colorScheme.error,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(),
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
      ),
    );
  }
}
