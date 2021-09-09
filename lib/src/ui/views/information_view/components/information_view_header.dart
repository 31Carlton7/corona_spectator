import 'package:canton_design_system/canton_design_system.dart';

class InformationViewHeader extends StatelessWidget {
  const InformationViewHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 17, right: 17),
      child: ViewHeaderOne(
        title: 'Information',
      ),
    );
  }
}
