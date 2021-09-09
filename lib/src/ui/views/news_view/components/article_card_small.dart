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

class ArticleCardSmall extends StatelessWidget {
  const ArticleCardSmall(this.article);

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
        shape: const SquircleBorder(radius: BorderRadius.zero),
        margin: const EdgeInsets.symmetric(vertical: 0),
        color: CantonColors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 7),
          child: Row(
            children: [
              Flexible(
                flex: 3,
                child: Container(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        article.source!,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(color: Theme.of(context).primaryColor),
                      ),
                      const SizedBox(height: 7),
                      Container(
                        width: MediaQuery.of(context).size.width - 64,
                        child: Text(
                          article.title!
                              .substring(0, article.title!.indexOf(' - ')),
                          maxLines: 2,
                          style:
                              Theme.of(context).textTheme.headline5?.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                      SizedBox(height: 7),
                      Container(
                        width: MediaQuery.of(context).size.width - 164,
                        child: Text(
                          '',
                          style: Theme.of(context).textTheme.caption?.copyWith(
                                color: Theme.of(context)
                                    .colorScheme
                                    .secondaryVariant,
                                fontWeight: FontWeight.w400,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: ClipSquircleBorder(
                  radius: BorderRadius.circular(30),
                  child: Image.network(
                    article.image!,
                    fit: BoxFit.cover,
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
