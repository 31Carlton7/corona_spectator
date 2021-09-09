import 'package:canton_design_system/canton_design_system.dart';
import 'package:corona_spectator/src/models/country_data.dart';
import 'package:corona_spectator/src/providers/all_country_data_provider.dart';
import 'package:corona_spectator/src/providers/country_data_provider.dart';
import 'package:corona_spectator/src/providers/country_repository_provider.dart';
import 'package:corona_spectator/src/ui/components/error_body.dart';
import 'package:corona_spectator/src/ui/components/unexpected_error.dart';
import 'package:corona_spectator/src/ui/views/home_view.dart/components/search_bar.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> showCountrySelectorBottomSheet(BuildContext context) async {
  Widget _countrySelectionCard(CountryData data) {
    return Consumer(builder: (context, watch, child) {
      final countryRepo = watch(countryRepositoryProvider);
      return GestureDetector(
        onTap: () async {
          await countryRepo.changeCountry(data.name!);
          context.refresh(countryDataProvider);

          Navigator.pop(context);
        },
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 3, horizontal: 17),
          title: Text(
            data.name!,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
      );
    });
  }

  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    elevation: 0,
    useRootNavigator: true,
    builder: (context) {
      List<CountryData> filteredCountries = [];

      return GestureDetector(
        onTap: () => CantonMethods.defocusTextfield(context),
        child: FractionallySizedBox(
          heightFactor: 0.95,
          child: Scaffold(
            backgroundColor: CantonColors.transparent,
            body: Container(
              decoration: ShapeDecoration(
                color: Theme.of(context).backgroundColor,
                shape: SquircleBorder(
                  radius: BorderRadius.circular(55),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.only(top: 15, left: 27, right: 27),
                    child: Container(
                      height: 5,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 27),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Cancel',
                            style:
                                Theme.of(context).textTheme.headline6?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondaryVariant,
                                    ),
                          ),
                        ),
                        Spacer(flex: 6),
                        Text(
                          'Countries',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Spacer(flex: 9),
                      ],
                    ),
                  ),
                  SizedBox(height: 7),
                  Divider(),
                  StatefulBuilder(
                    builder: (context, setState) {
                      return Consumer(
                        builder: (context, watch, child) {
                          final repo = watch(allCountryDataProvider);

                          return repo.when(
                            error: (e, s) {
                              if (e is DioError) {
                                return ErrorBody(
                                    e.message, allCountryDataProvider);
                              }
                              return UnexpectedError(allCountryDataProvider);
                            },
                            loading: () => Expanded(child: Loading()),
                            data: (data) {
                              var sortedCountries = data;
                              sortedCountries.sort(
                                (a, b) => a.name!.compareTo(b.name!),
                              );
                              List<CountryData> countries =
                                  filteredCountries.isNotEmpty
                                      ? filteredCountries
                                      : sortedCountries;

                              void _searchCountries(String query) {
                                final newCountryList =
                                    sortedCountries.where((country) {
                                  return country
                                      .toString()
                                      .toLowerCase()
                                      .contains(query.toLowerCase());
                                }).toList();

                                setState(() {
                                  if (newCountryList.isNotEmpty) {
                                    filteredCountries = newCountryList;
                                  }
                                });
                              }

                              return Expanded(
                                child: ListView.builder(
                                  itemCount: countries.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        if (index == 0)
                                          SearchBar(_searchCountries),
                                        _countrySelectionCard(countries[index]),
                                        Divider(),
                                      ],
                                    );
                                  },
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
