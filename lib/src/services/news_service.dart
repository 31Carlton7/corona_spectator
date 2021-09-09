import 'dart:convert';

import 'package:canton_design_system/canton_design_system.dart';
import 'package:dio/dio.dart';
import 'package:flutter_link_previewer/flutter_link_previewer.dart';
import 'package:xml2json/xml2json.dart';

import 'package:corona_spectator/src/config/exceptions.dart';
import 'package:corona_spectator/src/models/article.dart';

class NewsService {
  NewsService(this._dio);

  final Dio _dio;
  final _rootUrl = 'https://news.google.com/rss/search?q=coronavrius&hl=en-US';

  Future<List<Article>> getArticles() async {
    try {
      final transformer = Xml2Json();
      final response = await _dio.get(_rootUrl);

      transformer.parse(response.toString());

      var doc = transformer.xmlParserResult!.getElement('rss')!.innerXml;

      transformer.parse(doc);

      var formatted = json.decode(transformer.toParker());

      final results =
          List<Map<String, dynamic>>.from(formatted['channel']['item']);

      results.removeRange(19, results.length - 1);

      var data = results.map((article) {
        return Article.fromMap(article).copyWith(
          image: '',
          description: CantonMethods.removeAllHtmlTags(
            article['description'],
          ),
        );
      }).toList(growable: false);

      List<Article> newArticleList = [];

      for (var item in data) {
        var newItem = item;
        final previewData = await getPreviewData(newItem.link!);

        newItem.image = previewData.image!.url;

        newArticleList.add(newItem);
      }

      return newArticleList;
    } on DioError catch (e) {
      throw Exceptions.fromDioError(e);
    }
  }
}
