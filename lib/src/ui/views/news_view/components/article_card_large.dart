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
import 'package:corona_spectator/src/models/article.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleCardLarge extends StatelessWidget {
  const ArticleCardLarge(this.article);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (await canLaunch(article.link!)) {
          await launch(article.link!);
        } else {
          throw 'Could not launch ${article.link!}';
        }
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        margin: const EdgeInsets.symmetric(horizontal: 17),
        color: Theme.of(context).canvasColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipSquircleBorder(
              radius: BorderRadius.circular(30),
              child: Image.network(
                article.image!,
                fit: BoxFit.cover,
                height: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
              child: Text(
                article.source!,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(color: Theme.of(context).primaryColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                article.title!,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            //   child: Text(
            //     article.getPublishedAtFormattedTime,
            //     style: Theme.of(context).textTheme.caption.copyWith(
            //           color: Theme.of(context).colorScheme.secondaryVariant,
            //           fontWeight: FontWeight.w400,
            //         ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
