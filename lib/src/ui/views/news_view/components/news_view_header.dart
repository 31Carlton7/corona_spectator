import 'package:canton_design_system/canton_design_system.dart';

class NewsViewHeader extends StatelessWidget {
  const NewsViewHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 17, left: 27),
      child: ViewHeaderOne(title: 'News'),
    );
  }
}
