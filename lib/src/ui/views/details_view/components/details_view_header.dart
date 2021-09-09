import 'package:canton_design_system/canton_design_system.dart';
import 'package:corona_spectator/src/models/country_data.dart';
import 'package:corona_spectator/src/ui/components/country_selector.dart';

class DetailsViewHeader extends StatelessWidget {
  const DetailsViewHeader(this.data);

  final CountryData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CantonBackButton(isClear: true),
          CountrySelector(data),
          CantonNullButton(),
        ],
      ),
    );
  }
}
