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

class PreventionCard extends StatelessWidget {
  const PreventionCard({
    required this.title,
    required this.content,
    required this.iconPath,
  });

  final String title;
  final String content;
  final IconData iconPath;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
          child: Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  iconPath,
                  size: 24,
                  color: CantonColors.white,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      content,
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 15,
                            color: Theme.of(context).colorScheme.secondaryVariant,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
