import 'dart:convert';

import 'package:collection/collection.dart';

import 'source.dart';

class Article {
  Source? source;
  dynamic author;
  String? title;
  dynamic description;
  String? url;
  dynamic urlToImage;
  DateTime? publishedAt;
  dynamic content;

  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  @override
  String toString() {
    return 'Article(source: $source, author: $author, title: $title, description: $description, url: $url, urlToImage: $urlToImage, publishedAt: $publishedAt, content: $content)';
  }

  factory Article.fromMap(Map<String, dynamic> data) => Article(
        source: data['source'] == null
            ? null
            : Source.fromMap(data['source'] as Map<String, dynamic>),
        author: data['author'] as dynamic,
        title: data['title'] as String?,
        description: data['description'] as dynamic,
        url: data['url'] as String?,
        urlToImage: data['urlToImage'] as dynamic,
        publishedAt: data['publishedAt'] == null
            ? null
            : DateTime.parse(data['publishedAt'] as String),
        content: data['content'] as dynamic,
      );

  Map<String, dynamic> toMap() => {
        'source': source?.toMap(),
        'author': author,
        'title': title,
        'description': description,
        'url': url,
        'urlToImage': urlToImage,
        'publishedAt': publishedAt?.toIso8601String(),
        'content': content,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Article].
  factory Article.fromJson(String data) {
    return Article.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Article] to a JSON string.
  String toJson() => json.encode(toMap());

  Article copyWith({
    Source? source,
    dynamic author,
    String? title,
    dynamic description,
    String? url,
    dynamic urlToImage,
    DateTime? publishedAt,
    dynamic content,
  }) {
    return Article(
      source: source ?? this.source,
      author: author ?? this.author,
      title: title ?? this.title,
      description: description ?? this.description,
      url: url ?? this.url,
      urlToImage: urlToImage ?? this.urlToImage,
      publishedAt: publishedAt ?? this.publishedAt,
      content: content ?? this.content,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Article) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      source.hashCode ^
      author.hashCode ^
      title.hashCode ^
      description.hashCode ^
      url.hashCode ^
      urlToImage.hashCode ^
      publishedAt.hashCode ^
      content.hashCode;
}
