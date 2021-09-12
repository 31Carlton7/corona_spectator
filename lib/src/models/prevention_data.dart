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

import 'package:flutter/material.dart';

class PreventionData {
  String title;
  String content;
  IconData iconPath;

  PreventionData({
    required this.title,
    required this.content,
    required this.iconPath,
  });

  PreventionData copyWith({
    String? title,
    String? content,
    IconData? iconPath,
  }) {
    return PreventionData(
      title: title ?? this.title,
      content: content ?? this.content,
      iconPath: iconPath ?? this.iconPath,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      'iconPath': iconPath,
    };
  }

  factory PreventionData.fromMap(Map<String, dynamic> map) {
    return PreventionData(
      title: map['title'],
      content: map['content'],
      iconPath: map['iconPath'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PreventionData.fromJson(String source) => PreventionData.fromMap(json.decode(source));

  @override
  String toString() => 'PreventionData(title: $title, content: $content, iconPath: $iconPath)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PreventionData && other.title == title && other.content == content && other.iconPath == iconPath;
  }

  @override
  int get hashCode => title.hashCode ^ content.hashCode ^ iconPath.hashCode;
}
