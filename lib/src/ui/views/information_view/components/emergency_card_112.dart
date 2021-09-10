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
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class EmergencyCard112 extends StatelessWidget {
  const EmergencyCard112({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await FlutterPhoneDirectCaller.callNumber('112');
      },
      child: Card(
        shape: SquircleBorder(
          radius: BorderRadius.zero,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'General',
                style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: Theme.of(context).colorScheme.secondaryVariant,
                    ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    '112',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  const SizedBox(width: 7),
                  Icon(
                    Iconsax.call,
                    color: Theme.of(context).primaryColor,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
