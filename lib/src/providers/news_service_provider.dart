import 'package:corona_spectator/src/services/news_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final newsServiceProvider = Provider<NewsService>((ref) {
  return NewsService(Dio());
});
