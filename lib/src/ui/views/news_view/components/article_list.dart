import 'package:canton_design_system/canton_design_system.dart';
import 'package:corona_spectator/src/models/article.dart';
import 'package:corona_spectator/src/ui/views/news_view/components/article_card_large.dart';
import 'package:corona_spectator/src/ui/views/news_view/components/article_card_small.dart';

class ArticleList extends StatelessWidget {
  const ArticleList(this.articles);

  final List<Article> articles;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          switch (index) {
            case 0:
              return ArticleCardLarge(articles[index]);
            case 1:
              return SizedBox(height: 15);
            default:
              return ArticleCardSmall(articles[index]);
          }
        },
        childCount: articles.length,
      ),
    );
  }
}
