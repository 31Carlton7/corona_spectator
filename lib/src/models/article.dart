/*
Corona Spectator
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

class Article {
  String? title;
  String? link;
  String? source;
  String? description;

  Article({
    this.title,
    this.link,
    this.source,
    this.description,
  });

  Article copyWith({
    String? title,
    String? link,
    String? source,
    String? description,
  }) {
    return Article(
      title: title ?? this.title,
      link: link ?? this.link,
      source: source ?? this.source,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'link': link,
      'source': source,
      'description': description,
    };
  }

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      title: map['title'],
      link: map['link'],
      source: map['source'],
      description: map['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Article.fromJson(String source) => Article.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Article(title: $title, link: $link, source: $source, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Article &&
        other.title == title &&
        other.link == link &&
        other.source == source &&
        other.description == description;
  }

  @override
  int get hashCode {
    return title.hashCode ^ link.hashCode ^ source.hashCode ^ description.hashCode;
  }
}
