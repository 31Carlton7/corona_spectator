import 'package:canton_design_system/canton_design_system.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class WHOCard extends StatelessWidget {
  const WHOCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      // color: Theme.of(context).colorScheme.secondary,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 7,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Coronavirus disease (COVID-19) advice for the public',
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
              text:
                  'https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public',
              style: Theme.of(context).textTheme.headline6,
              linkStyle: Theme.of(context).textTheme.headline6?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                    decoration: TextDecoration.underline,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
