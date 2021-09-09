import 'package:canton_design_system/canton_design_system.dart';
import 'package:corona_spectator/src/models/country_data.dart';
import 'package:intl/intl.dart';

class CountryNewCasesCard extends StatelessWidget {
  const CountryNewCasesCard(this.data);

  final CountryData data;

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
            Row(
              children: [
                Text.rich(
                  TextSpan(
                    text: 'Today • ',
                    children: [
                      TextSpan(
                        text: DateFormat('MMMd').format(DateTime.now()),
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondaryVariant,
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
                text:
                    '+${CantonMethods.separateNumberByThreeDigits(source: data.todaysCases!)} ',
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
