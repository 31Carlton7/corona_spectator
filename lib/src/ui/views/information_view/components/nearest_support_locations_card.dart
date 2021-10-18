import 'package:canton_design_system/canton_design_system.dart';
import 'package:corona_spectator/src/ui/views/nearest_support_locations_view/nearest_support_locations_view.dart';

class NearestSupportLocationsCard extends StatelessWidget {
  const NearestSupportLocationsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        CantonMethods.viewTransition(context, NearestSupportLocationsView());
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 2),
        shape: SmoothRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).dividerColor,
            width: 1.5,
          ),
          borderRadius: SmoothBorderRadius.all(
            SmoothRadius(
              cornerRadius: 15,
              cornerSmoothing: 1,
            ),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.only(
            left: 12,
            right: 12,
            top: 7,
            bottom: 12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Nearest Support Locations',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Spacer(),
                  CantonActionButton(
                    padding: EdgeInsets.zero,
                    alignment: MainAxisAlignment.end,
                    icon: Icon(
                      Iconsax.arrow_right_2,
                      size: 20,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      CantonMethods.viewTransition(context, NearestSupportLocationsView());
                    },
                  ),
                ],
              ),
              const SizedBox(height: 7),
              Text(
                'Search nearest locations for Testing, Vaccines, and Treatment.',
                style: Theme.of(context).textTheme.headline6?.copyWith(
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
