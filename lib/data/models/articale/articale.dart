import 'dart:convert';

import 'package:collection/collection.dart';

import 'article.dart';

class Articale {
  String? status;
  int? totalResults;
  List<Article>? articles;

  Articale({this.status, this.totalResults, this.articles});

  @override
  String toString() {
    return 'Articale(status: $status, totalResults: $totalResults, articles: $articles)';
  }

  factory Articale.fromMap(Map<String, dynamic> data) => Articale(
        status: data['status'] as String?,
        totalResults: data['totalResults'] as int?,
        articles: (data['articles'] as List<dynamic>?)
            ?.map((e) => Article.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'status': status,
        'totalResults': totalResults,
        'articles': articles?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Articale].
  factory Articale.fromJson(String data) {
    return Articale.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Articale] to a JSON string.
  String toJson() => json.encode(toMap());

  Articale copyWith({
    String? status,
    int? totalResults,
    List<Article>? articles,
  }) {
    return Articale(
      status: status ?? this.status,
      totalResults: totalResults ?? this.totalResults,
      articles: articles ?? this.articles,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Articale) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      status.hashCode ^ totalResults.hashCode ^ articles.hashCode;
}
