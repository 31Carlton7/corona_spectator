/*
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
import 'package:corona_spectator/src/models/country_data.dart';
import 'package:corona_spectator/src/models/state_data.dart';
import 'package:corona_spectator/src/models/world_data.dart';
import 'package:corona_spectator/src/providers/country_repository_provider.dart';
import 'package:corona_spectator/src/providers/state_data_provider.dart';
import 'package:corona_spectator/src/ui/components/error_body.dart';
import 'package:corona_spectator/src/ui/components/unexpected_error.dart';
import 'package:corona_spectator/src/providers/country_data_provider.dart';
import 'package:corona_spectator/src/providers/world_data_provider.dart';
import 'package:corona_spectator/src/ui/components/country_card.dart';
import 'package:corona_spectator/src/ui/views/statistics_view/components/statistics_view_header.dart';
import 'package:corona_spectator/src/ui/components/state_card.dart';
import 'package:corona_spectator/src/ui/components/world_card.dart';
import 'package:dio/dio.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StatisticsView extends StatefulWidget {
  const StatisticsView();

  @override
  _StatisticsViewState createState() => _StatisticsViewState();
}

class _StatisticsViewState extends State<StatisticsView> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final worldDataRepo = watch(worldDataProvider);
        final countryDataRepo = watch(countryDataProvider);
        final stateDataRepo = watch(stateDataProvider);

        return worldDataRepo.when(
          error: (e, s) {
            if (e is DioError) {
              return ErrorBody(e.message, worldDataProvider);
            }
            return UnexpectedError(worldDataProvider);
          },
          loading: () => Loading(),
          data: (worldData) {
            return countryDataRepo.when(
              error: (e, s) {
                if (e is DioError) {
                  return ErrorBody(e.message, worldDataProvider);
                }
                return UnexpectedError(worldDataProvider);
              },
              loading: () => Loading(),
              data: (countryData) {
                return stateDataRepo.when(
                  error: (e, s) {
                    if (e is DioError) {
                      return ErrorBody(e.message, worldDataProvider);
                    }
                    return UnexpectedError(worldDataProvider);
                  },
                  loading: () => Loading(),
                  data: (stateData) {
                    return _content(context, worldData, countryData, stateData);
                  },
                );
              },
            );
          },
        );
      },
    );
  }

  Widget _content(BuildContext context, WorldData worldData, CountryData countryData, StateData stateData) {
    var currentlySelectedCountry = context.read(countryRepositoryProvider).getCountry;
    Future<void> refresh() async {
      await context.refresh(worldDataProvider);
      await context.refresh(countryDataProvider);
      await context.refresh(stateDataProvider);
    }

    return EasyRefresh(
      header: ClassicalHeader(
        bgColor: Theme.of(context).primaryColor,
        textColor: CantonColors.white,
        infoColor: CantonColors.white,
        enableHapticFeedback: true,
        float: false,
      ),
      onRefresh: () async {
        return await refresh();
      },
      child: ListView(
        children: [
          StatisticsViewHeader(),
          SizedBox(height: 10),
          currentlySelectedCountry == 'USA' ? StateCard(stateData) : Container(),
          currentlySelectedCountry == 'USA' ? const SizedBox(height: 15) : Container(),
          CountryCard(countryData),
          SizedBox(height: 15),
          WorldCard(worldData),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 15),
            child: Center(
              child: Text(
                'Sources JHU (github.com/CSSEGISandData), Worldometers (worldometers.info/coronavirus), NovelCovid (github.com/disease-sh/API)',
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
          )
        ],
      ),
    );
  }
}
