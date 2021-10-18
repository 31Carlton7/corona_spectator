import 'package:canton_design_system/canton_design_system.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:maps_launcher/maps_launcher.dart';

class TestingFacilitiesCard extends StatelessWidget {
  const TestingFacilitiesCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await MapsLauncher.launchQuery('COVID-19 Testing Sites');
      },
      child: Card(
        shape: SquircleBorder(radius: BorderRadius.zero),
        child: Container(
          padding: const EdgeInsets.all(17),
          child: Row(
            children: [
              Icon(
                FontAwesomeIcons.handPaper,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(width: 7),
              Text(
                'Testing Facilities',
                style: Theme.of(context).textTheme.headline5,
              ),
              Spacer(),
              Icon(
                Iconsax.arrow_right_2,
                size: 20,
                color: Theme.of(context).colorScheme.secondaryVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
