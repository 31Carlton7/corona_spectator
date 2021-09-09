import 'package:canton_design_system/canton_design_system.dart';
import 'package:corona_spectator/src/config/bottom_navigation_bar.dart';
import 'package:corona_spectator/src/providers/country_repository_provider.dart';
import 'package:corona_spectator/src/providers/state_repository_provider.dart';
import 'package:corona_spectator/src/ui/views/home_view.dart/home_view.dart';
import 'package:corona_spectator/src/ui/views/information_view/information_view.dart';
import 'package:corona_spectator/src/ui/views/news_view/news_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CurrentView extends StatefulWidget {
  @override
  _CurrentViewState createState() => _CurrentViewState();
}

class _CurrentViewState extends State<CurrentView> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadLocalData();
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _loadLocalData() {
    context.read(countryRepositoryProvider).loadData();
    context.read(stateRepositoryProvider).loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final List<Widget> _views = [
          HomeView(),
          NewsView(),
          InformationView(),
        ];

        Color _canvasColor() {
          if (_currentIndex != 1) return Theme.of(context).canvasColor;

          if (MediaQuery.of(context).platformBrightness == Brightness.dark) {
            return Theme.of(context).canvasColor;
          }
          return Theme.of(context).backgroundColor;
        }

        return CantonScaffold(
          padding: ([0, 1].contains(_currentIndex)) ? EdgeInsets.zero : null,
          bottomNavBar: BottomNavBar(_currentIndex, _onTabTapped),
          backgroundColor: _canvasColor(),
          body: _views[_currentIndex],
        );
      },
    );
  }
}
