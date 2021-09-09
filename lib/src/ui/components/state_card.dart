import 'package:canton_design_system/canton_design_system.dart';
import 'package:corona_spectator/src/models/state_data.dart';
import 'package:corona_spectator/src/ui/components/state_selector_bottomsheet.dart';
import 'package:intl/intl.dart';

class StateCard extends StatelessWidget {
  const StateCard(this.data);

  final StateData data;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).backgroundColor,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Card(
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    color: Theme.of(context).colorScheme.onSecondary,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Active Cases',
                            style:
                                Theme.of(context).textTheme.headline6?.copyWith(
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
                                  color: Theme.of(context).colorScheme.surface,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Card(
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    color: Theme.of(context).colorScheme.onSecondary,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Deaths',
                            style:
                                Theme.of(context).textTheme.headline6?.copyWith(
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
    );
  }

  String _stateNameText(String source) {
    if (source.length > 25) {
      return source.substring(0, 23) + '...';
    }
    return source;
  }
}
