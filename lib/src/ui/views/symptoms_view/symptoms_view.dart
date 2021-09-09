import 'package:canton_design_system/canton_design_system.dart';
import 'package:corona_spectator/src/ui/views/symptoms_view/components/symptoms_view_header.dart';

class SymptomsView extends StatelessWidget {
  const SymptomsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CantonScaffold(body: _content(context));
  }

  Widget _content(BuildContext context) {
    return Column(
      children: [
        SymptomsViewHeader(),
      ],
    );
  }
}
