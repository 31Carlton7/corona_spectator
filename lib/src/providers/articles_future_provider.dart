import 'package:corona_spectator/src/models/article.dart';
import 'package:corona_spectator/src/providers/news_service_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final articlesProvider = FutureProvider.autoDispose<List<Article>>((ref) async {
  ref.maintainState = true;
  return ref.read(newsServiceProvider).getArticles();
});
