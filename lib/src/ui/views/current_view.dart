/*
Corona Spectator
Copyright (C) 2021  Carlton Aikins

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
*/

import 'package:canton_design_system/canton_design_system.dart';
import 'package:corona_spectator/src/config/bottom_navigation_bar.dart';
import 'package:corona_spectator/src/providers/country_repository_provider.dart';
import 'package:corona_spectator/src/providers/state_repository_provider.dart';
import 'package:corona_spectator/src/ui/views/statistics_view/statistics_view.dart';
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
          StatisticsView(),
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
