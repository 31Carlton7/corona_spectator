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

import 'dart:convert';

import 'package:canton_design_system/canton_design_system.dart';
import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:xml2json/xml2json.dart';

import 'package:corona_spectator/src/config/exceptions.dart';
import 'package:corona_spectator/src/models/article.dart';

class NewsService {
  NewsService(this._dio);

  final Dio _dio;
  final _rootUrl = 'https://news.google.com/rss/search?q=covid-19&hl=en-US';

  Future<List<Article>> getArticles() async {
    try {
      final transformer = Xml2Json();
      final response = await _dio.get(_rootUrl);

      transformer.parse(response.toString());

      var doc = transformer.xmlParserResult!.getElement('rss')!.innerXml;

      transformer.parse(doc);

      var formatted = json.decode(transformer.toParker());

      final results = List<Map<String, dynamic>>.from(formatted['channel']['item']);

      results.removeRange(19, results.length - 1);

      var data = results.map((article) {
        return Article.fromMap(article).copyWith(
          description: CantonMethods.removeAllHtmlTags(
            article['description'],
          ),
        );
      }).toList(growable: false);

      return data;
    } on DioError catch (e) {
      await FirebaseCrashlytics.instance.recordError(
        e,
        e.stackTrace,
      );

      throw Exceptions.fromDioError(e);
    }
  }
}
