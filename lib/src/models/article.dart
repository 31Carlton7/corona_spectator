import 'dart:convert';

class Article {
  String? title;
  String? link;
  String? image;
  String? source;
  String? description;

  Article({
    this.title,
    this.link,
    this.image,
    this.source,
    this.description,
  });

  Article copyWith({
    String? title,
    String? link,
    String? image,
    String? source,
    String? description,
  }) {
    return Article(
      title: title ?? this.title,
      link: link ?? this.link,
      image: image ?? this.image,
      source: source ?? this.source,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'link': link,
      'image': image,
      'source': source,
      'description': description,
    };
  }

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      title: map['title'],
      link: map['link'],
      image: map['image'],
      source: map['source'],
      description: map['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Article.fromJson(String source) =>
      Article.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Article(title: $title, link: $link, image: $image, source: $source, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Article &&
        other.title == title &&
        other.link == link &&
        other.image == image &&
        other.source == source &&
        other.description == description;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        link.hashCode ^
        image.hashCode ^
        source.hashCode ^
        description.hashCode;
  }
}
