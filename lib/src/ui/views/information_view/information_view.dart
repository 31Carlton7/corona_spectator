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
import 'package:corona_spectator/src/ui/views/information_view/components/information_view_header.dart';
import 'package:corona_spectator/src/ui/views/information_view/components/who_card.dart';
import 'package:corona_spectator/src/ui/views/prevention_view/prevention_view.dart';
import 'package:corona_spectator/src/ui/views/symptoms_view/symptoms_view.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class InformationView extends StatelessWidget {
  const InformationView();

  @override
  Widget build(BuildContext context) {
    return _content(context);
  }

  Widget _content(BuildContext context) {
    return ListView(
      children: [
        InformationViewHeader(),
        _healthTipsSection(context),
        _emergencyContactsSection(context),
        _usefulLinksSection(context),
      ],
    );
  }

  Widget _healthTipsSection(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Health Tips',
            style: Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(height: 7),
          _symptomsCard(context),
          Divider(),
          _preventionCard(context),
        ],
      ),
    );
  }

  Widget _emergencyContactsSection(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Emergency Contacts',
            style: Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(height: 7),
          _911EmergencyCard(context),
          Divider(),
          _112EmergencyCard(context),
          Divider(),
          _119EmergencyCard(context),
        ],
      ),
    );
  }

  Widget _usefulLinksSection(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Useful Links',
            style: Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(height: 7),
          WHOCard(),
        ],
      ),
    );
  }

  Widget _symptomsCard(BuildContext context) {
    return GestureDetector(
      onTap: () {
        CantonMethods.viewTransition(context, SymptomsView());
      },
      child: Card(
        shape: SquircleBorder(
          radius: BorderRadius.vertical(
            top: Radius.circular(37),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.only(
            left: 12,
            right: 12,
            bottom: 12,
            top: 7.5,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Symptoms',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Spacer(),
                  CantonActionButton(
                    containerHeight: 20,
                    containerWidth: 20,
                    padding: EdgeInsets.zero,
                    alignment: MainAxisAlignment.end,
                    icon: Icon(
                      Iconsax.arrow_right_2,
                      size: 20,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      CantonMethods.viewTransition(context, SymptomsView());
                    },
                  ),
                ],
              ),
              Text(
                'Take a look at the most common symptoms of the COVID-19 Virus.',
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

  Widget _preventionCard(BuildContext context) {
    return GestureDetector(
      onTap: () {
        CantonMethods.viewTransition(context, PreventionView());
      },
      child: Card(
        // color: Theme.of(context).colorScheme.secondary,
        shape: SquircleBorder(
          radius: BorderRadius.vertical(
            bottom: Radius.circular(37),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.only(
            left: 12,
            right: 12,
            bottom: 12,
            top: 7.5,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Prevention & Advice',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Spacer(),
                  CantonActionButton(
                    padding: EdgeInsets.zero,
                    alignment: MainAxisAlignment.end,
                    icon: Icon(
                      Iconsax.arrow_right_2,
                      size: 20,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      CantonMethods.viewTransition(context, PreventionView());
                    },
                  ),
                ],
              ),
              Text(
                'Advice on how to protect yourself and prevent the spread.',
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

  // ignore: non_constant_identifier_names
  Widget _911EmergencyCard(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await FlutterPhoneDirectCaller.callNumber('911');
      },
      child: Card(
        // color: Theme.of(context).colorScheme.secondary,
        shape: SquircleBorder(
          radius: BorderRadius.vertical(
            top: Radius.circular(37),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'USA',
                style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: Theme.of(context).colorScheme.secondaryVariant,
                    ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    '911',
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

  // ignore: non_constant_identifier_names
  Widget _112EmergencyCard(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await FlutterPhoneDirectCaller.callNumber('112');
      },
      child: Card(
        // color: Theme.of(context).colorScheme.secondary,
        shape: SquircleBorder(
          radius: BorderRadius.zero,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Europe',
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

  // ignore: non_constant_identifier_names
  Widget _119EmergencyCard(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await FlutterPhoneDirectCaller.callNumber('119');
      },
      child: Card(
        // color: Theme.of(context).colorScheme.secondary,
        shape: SquircleBorder(
          radius: BorderRadius.vertical(
            bottom: Radius.circular(37),
          ),
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
                    '119',
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
