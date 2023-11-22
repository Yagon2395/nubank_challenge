import 'dart:convert';

class UrlModel {
  final String url;
  const UrlModel({required this.url});

  Map<String, dynamic> toMap() {
    return {
      'url': url,
    };
  }

  static UrlModel fromMap(Map<String, dynamic> map) {
    return UrlModel(
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  static UrlModel fromJson(String source) => fromMap(json.decode(source));
}
