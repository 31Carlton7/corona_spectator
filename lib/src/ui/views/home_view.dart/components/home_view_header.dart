import 'package:canton_design_system/canton_design_system.dart';

class HomeViewHeader extends StatelessWidget {
  const HomeViewHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 17, left: 17, right: 17),
      child: ViewHeaderOne(
        title: 'Statistics',
      ),
    );
  }
}
