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
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UnexpectedError extends StatelessWidget {
  const UnexpectedError(this.provider);
  final AutoDisposeFutureProvider provider;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Oops, something unexpected happened :(',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline5?.copyWith(
                  color: Theme.of(context).colorScheme.secondaryVariant,
                ),
          ),
          SizedBox(height: 20),
          CantonPrimaryButton(
            buttonText: 'Retry',
            textColor: CantonColors.white,
            padding: EdgeInsets.zero,
            containerWidth: MediaQuery.of(context).size.width / 2 - 74,
            onPressed: () => context.refresh(provider),
          ),
        ],
      ),
    );
  }
}
