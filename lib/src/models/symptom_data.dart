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

import 'package:canton_design_system/canton_design_system.dart';

class SymptomData {
  String text;
  IconData iconPath;

  SymptomData({
    required this.text,
    required this.iconPath,
  });

  SymptomData copyWith({
    String? text,
    IconData? iconPath,
  }) {
    return SymptomData(
      text: text ?? this.text,
      iconPath: iconPath ?? this.iconPath,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'iconPath': iconPath,
    };
  }

  factory SymptomData.fromMap(Map<String, dynamic> map) {
    return SymptomData(
      text: map['text'],
      iconPath: map['iconPath'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SymptomData.fromJson(String source) => SymptomData.fromMap(json.decode(source));

  @override
  String toString() => 'SymptomData(text: $text, iconPath: $iconPath)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SymptomData && other.text == text && other.iconPath == iconPath;
  }

  @override
  int get hashCode => text.hashCode ^ iconPath.hashCode;
}
