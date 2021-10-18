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
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SymptomCheckerCard extends StatelessWidget {
  const SymptomCheckerCard();

  @override
  Widget build(BuildContext context) {
    final link = 'https://www.cdc.gov/coronavirus/2019-ncov/symptoms-testing/coronavirus-self-checker.html';
    return GestureDetector(
      onTap: () async {
        if (await canLaunch(link)) {
          await launch(link);
        } else {
          throw 'Could not launch $link';
        }
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 2),
        shape: SmoothRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).dividerColor,
            width: 1.5,
          ),
          borderRadius: SmoothBorderRadius.all(
            SmoothRadius(
              cornerRadius: 15,
              cornerSmoothing: 1,
            ),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.only(
            left: 12,
            right: 12,
            top: 7,
            bottom: 12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Symptom Checker',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Spacer(),
                  CantonActionButton(
                    padding: EdgeInsets.zero,
                    alignment: MainAxisAlignment.end,
                    icon: Icon(
                      FontAwesomeIcons.externalLinkAlt,
                      size: 14,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () async {
                      if (await canLaunch(link)) {
                        await launch(link);
                      } else {
                        throw 'Could not launch $link';
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(height: 7),
              Text(
                'Take the CDC Symptom Checker to see if you may show signs of the COVID-19 Virus.',
                style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: Theme.of(context).colorScheme.secondaryVariant,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
