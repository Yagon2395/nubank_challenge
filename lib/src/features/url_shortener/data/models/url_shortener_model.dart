import 'dart:convert';

import 'package:nubank_challenge/src/features/url_shortener/data/models/url_links_model.dart';

import '../../domain/entities/url_shortener.dart';

class UrlShortenerModel extends UrlShortener {
  const UrlShortenerModel({
    required super.alias,
    required super.links,
  });

  Map<String, dynamic> toMap() {
    return {
      'alias': alias,
      '_links': links,
    };
  }

  static UrlShortenerModel fromMap(Map<String, dynamic> map) {
    return UrlShortenerModel(
      alias: map['alias'],
      links: UrlLinksModel.fromMap(map['_links']),
    );
  }

  String toJson() => json.encode(toMap());

  static UrlShortenerModel fromJson(String source) =>
      fromMap(json.decode(source));
}
