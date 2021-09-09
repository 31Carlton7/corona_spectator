import 'package:canton_design_system/canton_design_system.dart';
import 'package:corona_spectator/src/models/country_data.dart';
import 'package:corona_spectator/src/ui/components/country_name_text.dart';
import 'package:corona_spectator/src/ui/components/country_selector_bottomsheet.dart';

class CountrySelector extends StatelessWidget {
  const CountrySelector(this.data);

  final CountryData data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
    );
  }
}
