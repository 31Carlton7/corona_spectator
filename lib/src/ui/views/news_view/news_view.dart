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
import 'package:corona_spectator/src/config/exceptions.dart';
import 'package:corona_spectator/src/models/article.dart';
import 'package:corona_spectator/src/providers/articles_future_provider.dart';
import 'package:corona_spectator/src/ui/components/error_body.dart';
import 'package:corona_spectator/src/ui/components/unexpected_error.dart';
import 'package:corona_spectator/src/ui/views/news_view/components/article_list.dart';
import 'package:corona_spectator/src/ui/views/news_view/components/news_view_header.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewsView extends StatefulWidget {
  const NewsView({Key? key}) : super(key: key);

  @override
  _NewsViewState createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final articlesRepo = watch(articlesProvider);

        return articlesRepo.when(
          error: (e, s) {
            if (e is Exceptions) {
              return ErrorBody(e.message, articlesProvider);
            }
            return UnexpectedError(articlesProvider);
          },
          loading: () => Loading(),
          data: (articles) {
            return _content(context, articles);
          },
        );
      },
    );
  }

  Widget _content(BuildContext context, List<Article> articles) {
    return EasyRefresh(
      header: ClassicalHeader(
        bgColor: CantonColors.bgSecondary!,
        enableHapticFeedback: true,
        float: false,
      ),
      onRefresh: () async {
        return await context.refresh(articlesProvider);
      },
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: NewsViewHeader()),
          ArticleList(articles),
        ],
      ),
    );
  }
}
