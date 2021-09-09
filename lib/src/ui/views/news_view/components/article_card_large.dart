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
        shape: const SquircleBorder(radius: BorderRadius.zero),
        margin: const EdgeInsets.symmetric(horizontal: 17),
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
