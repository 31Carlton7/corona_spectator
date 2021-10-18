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
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _statisticsNavigatorKey = GlobalKey<NavigatorState>();
final _newsNavigatorKey = GlobalKey<NavigatorState>();
final _informationNavigatorKey = GlobalKey<NavigatorState>();

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
    if (index == _currentIndex && _currentIndex == 0 && _statisticsNavigatorKey.currentState!.canPop()) {
      _statisticsNavigatorKey.currentState!.pop();
    }
    if (index == _currentIndex && _currentIndex == 1 && _newsNavigatorKey.currentState!.canPop()) {
      _newsNavigatorKey.currentState!.pop();
    }
    if (index == _currentIndex && _currentIndex == 2 && _informationNavigatorKey.currentState!.canPop()) {
      _informationNavigatorKey.currentState!.pop();
    }

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
          padding: EdgeInsets.zero,
          bottomNavBar: BottomNavBar(_currentIndex, _onTabTapped),
          safeArea: false,
          backgroundColor: CantonMethods.alternateCanvasColor(context, index: _currentIndex, targetIndexes: [1]),
          body: IndexedStack(
            index: _currentIndex,
            children: [
              Navigator(
                key: _statisticsNavigatorKey,
                observers: [FirebaseAnalyticsObserver(analytics: FirebaseAnalytics())],
                onGenerateRoute: (settings) {
                  return MaterialPageRoute(
                    settings: settings,
                    fullscreenDialog: true,
                    builder: (context) => SafeArea(child: _views[_currentIndex]),
                  );
                },
              ),
              Navigator(
                key: _newsNavigatorKey,
                observers: [FirebaseAnalyticsObserver(analytics: FirebaseAnalytics())],
                onGenerateRoute: (settings) {
                  return MaterialPageRoute(
                    settings: settings,
                    fullscreenDialog: true,
                    builder: (context) => SafeArea(child: _views[_currentIndex]),
                  );
                },
              ),
              Navigator(
                key: _informationNavigatorKey,
                observers: [FirebaseAnalyticsObserver(analytics: FirebaseAnalytics())],
                onGenerateRoute: (settings) {
                  return MaterialPageRoute(
                    settings: settings,
                    fullscreenDialog: true,
                    builder: (context) => SafeArea(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 17),
                        child: _views[_currentIndex],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
