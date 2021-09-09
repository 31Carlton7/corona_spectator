import 'package:canton_design_system/canton_design_system.dart';
import 'package:corona_spectator/src/models/country_data.dart';
import 'package:corona_spectator/src/models/state_data.dart';
import 'package:corona_spectator/src/providers/all_country_data_provider.dart';
import 'package:corona_spectator/src/providers/country_data_provider.dart';
import 'package:corona_spectator/src/providers/state_data_provider.dart';
import 'package:corona_spectator/src/ui/components/error_body.dart';
import 'package:corona_spectator/src/ui/components/unexpected_error.dart';
import 'package:corona_spectator/src/ui/views/details_view/components/country_details_card.dart';
import 'package:corona_spectator/src/ui/views/details_view/components/country_new_cases_card.dart';
import 'package:corona_spectator/src/ui/views/details_view/components/details_view_header.dart';
import 'package:corona_spectator/src/ui/components/state_card.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailsView extends StatefulWidget {
  const DetailsView();

  @override
  _DetailsViewState createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  Widget build(BuildContext context) {
    return CantonScaffold(
      padding: EdgeInsets.zero,
      body: _content(context),
    );
  }

  Widget _content(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final stateRepo = watch(stateDataProvider);
        final countryRepo = watch(countryDataProvider);
        final allCountriesRepo = watch(allCountryDataProvider);

        return countryRepo.when(
          error: (e, s) {
            if (e is DioError) {
              return ErrorBody(e.message, stateDataProvider);
            }
            return UnexpectedError(stateDataProvider);
          },
          loading: () => Loading(),
          data: (countryData) {
            return allCountriesRepo.when(
              error: (e, s) {
                if (e is DioError) {
                  return ErrorBody(e.message, stateDataProvider);
                }
                return UnexpectedError(stateDataProvider);
              },
              loading: () => Loading(),
              data: (allCountries) {
                var countries = allCountries;
                countries.sort(
                  (a, b) => b.totalCases!.compareTo(a.totalCases!),
                );
                var worldRanking = (countries.indexWhere(
                            (element) => element.name == countryData.name) +
                        1)
                    .toString();
                return stateRepo.when(
                  error: (e, s) {
                    if (e is DioError) {
                      return ErrorBody(e.message, stateDataProvider);
                    }
                    return UnexpectedError(stateDataProvider);
                  },
                  loading: () => Loading(),
                  data: (stateData) {
                    return Column(
                      children: [
                        DetailsViewHeader(countryData),
                        _body(context, countryData, stateData, worldRanking),
                      ],
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }

  Widget _body(BuildContext context, CountryData countryData,
      StateData stateData, String worldRanking) {
    return Expanded(
      child: ListView(
        children: [
          CountryNewCasesCard(countryData),
          const SizedBox(height: 15),
          if (countryData.name == 'USA') StateCard(stateData),
          if (countryData.name == 'USA') const SizedBox(height: 15),
          CountryDetailsCard(countryData, worldRanking),
        ],
      ),
    );
  }
}
