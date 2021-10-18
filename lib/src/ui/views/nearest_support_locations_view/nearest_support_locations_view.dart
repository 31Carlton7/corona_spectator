import 'package:canton_design_system/canton_design_system.dart';
import 'package:corona_spectator/src/ui/views/nearest_support_locations_view/components/nearest_support_locations_view_header.dart';
import 'package:corona_spectator/src/ui/views/nearest_support_locations_view/components/testing_facilities_card.dart';
import 'package:corona_spectator/src/ui/views/nearest_support_locations_view/components/treatment_centers_card.dart';
import 'package:corona_spectator/src/ui/views/nearest_support_locations_view/components/vaccine_clinics_card.dart';

class NearestSupportLocationsView extends StatelessWidget {
  const NearestSupportLocationsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CantonScaffold(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      body: _content(),
    );
  }

  Widget _content() {
    return Column(children: [
      NearestSupportLocationsViewHeader(),
      const SizedBox(height: 10),
      _body(),
    ]);
  }

  Widget _body() {
    return Expanded(child: _categoriesSection());
  }

  Widget _categoriesSection() {
    return Container(
      child: Column(
        children: [
          TreatmentCentersCard(),
          Divider(),
          TestingFacilitiesCard(),
          Divider(),
          VaccineClinicsCard(),
        ],
      ),
    );
  }
}
