import 'package:canton_design_system/canton_design_system.dart';
import 'package:corona_spectator/src/ui/views/prevention_view/components/prevention_view_header.dart';

class PreventionView extends StatelessWidget {
  const PreventionView();

  @override
  Widget build(BuildContext context) {
    return CantonScaffold(
      body: _content(context),
    );
  }

  Widget _content(BuildContext context) {
    return Column(
      children: [
        PreventionViewHeader(),
      ],
    );
  }
}
