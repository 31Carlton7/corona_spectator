import 'package:canton_design_system/canton_design_system.dart';

class SymptomsViewHeader extends StatelessWidget {
  const SymptomsViewHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewHeaderTwo(
      title: 'Symptoms',
      backButton: true,
    );
  }
}
