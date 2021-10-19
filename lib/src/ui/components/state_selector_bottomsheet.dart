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
import 'package:corona_spectator/src/models/state_data.dart';
import 'package:corona_spectator/src/providers/all_state_data_provider.dart';
import 'package:corona_spectator/src/providers/state_data_provider.dart';
import 'package:corona_spectator/src/providers/state_repository_provider.dart';
import 'package:corona_spectator/src/ui/components/error_body.dart';
import 'package:corona_spectator/src/ui/components/unexpected_error.dart';
import 'package:corona_spectator/src/ui/components/search_bar.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> showStateSelectorBottomSheet(BuildContext context) async {
  Widget _stateSelectionCard(StateData data) {
    return Consumer(
      builder: (context, watch, child) {
        final stateRepo = watch(stateRepositoryProvider);
        return GestureDetector(
          onTap: () async {
            await stateRepo.changeState(data.name!);
            context.refresh(stateDataProvider);

            Navigator.pop(context);
          },
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 17),
            title: Text(
              data.name!,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        );
      },
    );
  }

  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    elevation: 0,
    useRootNavigator: true,
    builder: (context) {
      List<StateData> filteredStates = [];

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
                    padding: const EdgeInsets.only(top: 15, left: 27, right: 27),
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
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 27),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Cancel',
                            style: Theme.of(context).textTheme.headline6?.copyWith(
                                  color: Theme.of(context).colorScheme.secondaryVariant,
                                ),
                          ),
                        ),
                        Spacer(flex: 6),
                        Text(
                          'States',
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
                          final repo = watch(allStateDataProvider);

                          return repo.when(
                            error: (e, s) {
                              if (e is DioError) {
                                return ErrorBody(e.message, allStateDataProvider);
                              }
                              return UnexpectedError(allStateDataProvider);
                            },
                            loading: () => Expanded(child: Loading()),
                            data: (data) {
                              List<StateData> states = filteredStates.isNotEmpty ? filteredStates : data;

                              states.sort((a, b) => a.name!.compareTo(b.name!));

                              void _searchStates(String query) {
                                final newStateList = data.where((state) {
                                  return state.toString().toLowerCase().contains(query.toLowerCase());
                                }).toList();

                                setState(() {
                                  if (newStateList.isNotEmpty) {
                                    filteredStates = newStateList;
                                  }
                                });
                              }

                              return Expanded(
                                child: GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onPanDown: (_) {
                                    FocusScope.of(context).requestFocus(FocusNode());
                                  },
                                  child: ListView.builder(
                                    itemCount: states.length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          if (index == 0) SearchBar(_searchStates),
                                          _stateSelectionCard(states[index]),
                                          Divider(),
                                        ],
                                      );
                                    },
                                  ),
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
