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
import 'package:figma_squircle/figma_squircle.dart';

class SearchBar extends StatelessWidget {
  const SearchBar(this.search, this.controller);

  final void Function(String) search;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
          padding: MediaQuery.of(context).viewInsets,
          child: CantonTextInput(
            hintText: 'Search',
            isTextFormField: false,
            obscureText: false,
            containerPadding: const EdgeInsets.all(10),
            radius: SmoothBorderRadius.all(
              SmoothRadius(cornerRadius: 35, cornerSmoothing: 1),
            ),
            controller: controller,
            onChanged: (query) {
              search(query);
            },
            prefixIcon: Icon(
              Iconsax.search_normal_1,
              color: Theme.of(context).colorScheme.secondaryVariant,
            ),
          ),
        ),
        Divider(),
      ],
    );
  }
}
