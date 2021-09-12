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
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class CDCCard extends StatelessWidget {
  const CDCCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final link = 'https://www.cdc.gov/coronavirus/2019-ncov/index.html';
    return GestureDetector(
      onTap: () async {
        if (await canLaunch(link)) {
          await launch(link);
        } else {
          throw 'Could not launch $link';
        }
      },
      child: Card(
        shape: SquircleBorder(
          radius: BorderRadius.vertical(
            top: Radius.circular(35),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 7,
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Centers for Disease Control & Prevention',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(height: 7),
                  Linkify(
                    onOpen: (link) async {
                      if (await canLaunch(link.url)) {
                        await launch(link.url);
                      } else {
                        throw 'Could not launch $link';
                      }
                    },
                    options: LinkifyOptions(removeWww: true),
                    text: 'https://www.cdc.gov/coronavirus/2019-ncov/index.html',
                    style: Theme.of(context).textTheme.headline6,
                    linkStyle: Theme.of(context).textTheme.headline6?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                          decoration: TextDecoration.underline,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
