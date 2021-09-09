import 'package:canton_design_system/canton_design_system.dart';
import 'package:corona_spectator/src/models/country_data.dart';
import 'package:corona_spectator/src/ui/components/country_name_text.dart';
import 'package:corona_spectator/src/ui/components/country_selector_bottomsheet.dart';
import 'package:corona_spectator/src/ui/views/details_view/details_view.dart';
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
        color: Theme.of(context).backgroundColor,
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
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
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
                          style:
                              Theme.of(context).textTheme.headline1?.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        TextSpan(
                          text: ' +' +
                              CantonMethods.separateNumberByThreeDigits(
                                source: data.todaysCases!,
                              ),
                          style:
                              Theme.of(context).textTheme.headline6?.copyWith(
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
              data.casesByDate!.isNotEmpty
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Card(
                          margin: const EdgeInsets.symmetric(vertical: 15),
                          color: Theme.of(context).colorScheme.onSecondary,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 40,
                            ),
                            child: Column(
                              children: [
                                Text(
                                  'Recovered',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondaryVariant,
                                      ),
                                ),
                                Text(
                                  CantonMethods.separateNumberByThreeDigits(
                                      source: data.totalRecovered!),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      ?.copyWith(
                                        fontSize: 16,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .background,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          margin: const EdgeInsets.symmetric(vertical: 15),
                          color: Theme.of(context).colorScheme.onSecondary,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 30,
                            ),
                            child: Column(
                              children: [
                                Text(
                                  'Active Cases',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondaryVariant,
                                      ),
                                ),
                                Text(
                                  CantonMethods.separateNumberByThreeDigits(
                                      source: data.activeCases!),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      ?.copyWith(
                                        fontSize: 16,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .surface,
                                      ),
                                ),
                                Text(
                                  '+' +
                                      CantonMethods.separateNumberByThreeDigits(
                                          source: data.todaysCases!),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .surface,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          margin: const EdgeInsets.symmetric(vertical: 15),
                          color: Theme.of(context).colorScheme.onSecondary,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 30,
                            ),
                            child: Column(
                              children: [
                                Text(
                                  'Deaths',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondaryVariant,
                                      ),
                                ),
                                Text(
                                  CantonMethods.separateNumberByThreeDigits(
                                      source: data.totalDeaths!),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      ?.copyWith(
                                        fontSize: 16,
                                        color:
                                            Theme.of(context).colorScheme.error,
                                      ),
                                ),
                                Text(
                                  '+' +
                                      CantonMethods.separateNumberByThreeDigits(
                                          source: data.todaysDeaths!),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(
                                        color:
                                            Theme.of(context).colorScheme.error,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  : Container(),
              Text(
                'Updated at ' +
                    DateFormat('M/d/yy').format(data.lastUpdated!).toString(),
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
